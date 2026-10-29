# test-project-terraform
Let's push your Terraform project from VS Code to GitHub step by step. Since you've already written and executed your Terraform code, we'll upload your existing project rather than recreate anything.
Step 1: Check your project files
In VS Code, open the folder containing your Terraform configuration. You might have files like these:
terraform-project/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
└── terraform.tfvars
Step 2: Create a .gitignore file
In VS Code Explorer, create a new file named .gitignore in your project root and add:

.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.tfvars.json
*.tfplan
crash.log
crash.*.log
.terraform.tfstate.lock.info
This prevents Terraform state files, local provider downloads, and variable files that may contain secrets from being uploaded. Keep .terraform.lock.hcl in Git; it records provider selections. 
HashiCorp Developer+1


Before continuing, check that you have not hardcoded passwords, client secrets, or Azure credentials in any .tf file.
Step 3: Create a repository on GitHub
1. Open GitHub — Create a new repository.
2. Enter a repository name, for example terraform-azure-networking.
3. Choose Private while you're learning or if the code relates to your work environment.
4. Leave Add a README file unchecked for this workflow.
5. Click Create repository.
GitHub will show you the repository URL. Copy the HTTPS URL. 
GitHub Docs

Step 4: Push your project from VS Code
Open Terminal → New Terminal in VS Code. Make sure the terminal is in your Terraform project folder.

Run these commands one by one in VS code.

A. Check Git is installed
- git --version

If Git is installed, it displays its version.

B. Initialize Git
- git init
C. Check which files will be uploaded
- git status
Confirm that .gitignore is present and state files or secrets are not listed for upload.

D. Stage your files
- git add .
E. Commit your files
- git commit -m "Add Azure Terraform subnet configuration"
F. Set the main branch
- git branch -M main
G. Connect your GitHub repository
Replace the example URL with the HTTPS URL you copied from GitHub.
- git remote add origin https://github.com/YOUR-USERNAME/terraform-azure-networking.git
H. Push your code
- git push -u origin main
Step 5: Verify
Refresh your GitHub repository page. You should see your Terraform files, such as main.tf, variables.tf, outputs.tf, and .gitignore.

Your GitHub repository test-project-terraform already contains some commits (for example, a README file created when you created the repository). Your local main branch has its own history, so Git won't overwrite the remote history automatically.
In your existing VS Code PowerShell terminal, run:

Step 1 — Pull the GitHub changes
- git pull origin main --allow-unrelated-histories
Git has opened the Vim text editor because it needs you to confirm the merge commit message. Your screenshot shows that you're currently in INSERT mode.
Do these 3 steps in your VS Code terminal
Step 1: Exit INSERT mode

Press Esc on your keyboard.

Step 2: Save and close Vim

Type the following exactly:
- :wq
Step 3: Push your Terraform code to GitHub

Once you return to the PowerShell terminal, run:
- git push -u origin main

verify