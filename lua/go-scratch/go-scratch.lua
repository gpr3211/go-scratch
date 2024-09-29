local M = {}

-- Configuration with default values
M.config = {
	base_path = vim.fn.expand("~/go_scratch"),
	go_mod_name = "example.com/myproject",
	run_after_create = false, -- Option to run the project after creation
}

local function create_directory(path)
	vim.fn.mkdir(path, "p")
end

local function init_go_mod(path, mod_name)
	local cmd = string.format("cd %s && go mod init %s", vim.fn.shellescape(path), mod_name)
	vim.fn.system(cmd)
end

local function create_main_go(path)
	local main_content = [[
package main

import "fmt"

func main() {
	fmt.Println("Hello, Go!")
}
]]
	local file_path = path .. "/main.go"
	vim.fn.writefile(vim.split(main_content, "\n"), file_path)
	return file_path
end

local function run_project(file_path)
	local project_dir = vim.fn.fnamemodify(file_path, ":h")
	local current_dir = vim.fn.getcwd()

	-- Change to the project directory temporarily
	vim.cmd("cd " .. vim.fn.fnameescape(project_dir))

	-- Run the Go project and display the output in the command-line area
	vim.cmd("!go run .")

	-- Change back to the original directory
	vim.cmd("cd " .. vim.fn.fnameescape(current_dir))
end

function M.create_go_project()
	local project_name = vim.fn.input("Enter project name: ")
	if project_name == "" then
		print("Project name cannot be empty")
		return
	end

	local project_path = M.config.base_path .. "/" .. project_name

	-- Create project directory
	create_directory(project_path)

	-- Initialize go.mod
	init_go_mod(project_path, M.config.go_mod_name .. "/" .. project_name)

	-- Create main.go and get its path
	local main_go_path = create_main_go(project_path)

	-- Open main.go in a new vertical split window
	vim.cmd("vsplit " .. main_go_path)

	-- Run the project if configured to do so
	if M.config.run_after_create then
		run_project(main_go_path)
	end
end

function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})

	-- Create user commands
	vim.api.nvim_create_user_command("ScratchNew", M.create_go_project, {})
	vim.api.nvim_create_user_command("ScratchRun", function()
		local current_file = vim.fn.expand("%:p")
		run_project(current_file)
	end, {})
end

return M
