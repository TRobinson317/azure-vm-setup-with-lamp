# 🚀 Azure VM Setup With LAMP Script

This bash script automates the process of setting up a Virtual Machine (VM) on Microsoft Azure. It simplifies the process of creating and configuring a VM, opening a web traffic port, and setting up a web server.

## 📋 Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) should be installed on your local machine.

## 🚀 Getting Started

1. Clone this repository to your local machine.
    ```bash
    git clone <repository-url>
    ```
2. Navigate to the repository directory.
    ```bash
    cd <repository-path>
    ```
3. Run the script.
    ```bash
    bash azure-vm-setup-with-lamp.sh
    ```

## 📜 User Interface

This script provides an interactive menu, where you can select the operation you want to perform. Simply input the corresponding number, and the task will execute. This loop continues until you choose to quit.

Here's a sneak peek at the menu:

Select an option:
1) Install Azure CLI
2) Login to Azure
3. Create resource group
4. Create VM
5. Open port 80
6. Get VM IP
7. Install LAMP stack
8. Exit the script



## 🛠️ Functions

1. **Install Azure CLI**

   The `install_azure_cli` function facilitates the installation of the Azure Command Line Interface (CLI) on your local machine. It uses the `curl` command to fetch the installation script and the `sudo bash` command to execute it.

2. **Login to Azure**

   The `login_azure` function helps you log into your Azure account. It uses the `az login` command from the Azure CLI to authenticate your session.

3. **Create Resource Group**

   With the `create_resource_group` function, you can create a new Azure resource group. It prompts you for the name of the resource group and then uses the `az group create` command to create it.

4. **Create VM**

   The `create_vm` function lets you create a new virtual machine in Azure. It asks for VM details such as name, image, and size, then uses the `az vm create` command to set up the VM with these configurations.

5. **Open Port 80**

   The `open_port` function allows you to open port 80 on the created VM. This is particularly useful for web server applications. It uses the `az vm open-port` command to achieve this.

6. **Get VM IP**

   The `get_ip` function retrieves the public IP address of the VM. It utilizes the `az vm show` command to fetch the IP address, ensuring easy access to your VM.

7. **Install LAMP Stack**

   The `install_lamp` function installs the LAMP stack (Linux, Apache, MySQL, PHP) on the VM. It uses the `az vm run-command invoke` command to run a series of shell commands that install and set up the LAMP stack.

   


⚠️ Remember: This script manipulates Azure resources and could lead to charges on your Azure account. Always clean up resources you're not using to avoid unexpected costs.

