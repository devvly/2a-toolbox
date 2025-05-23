# 2A Toolbox

**Reusable development environment for Laravel projects**, powered by Docker and custom scripts for streamlined setup and workflow.

---

## ⚙️ Installation & Setup

### 1. Run the install script

After installing this package via Composer, run the install script to set up the core tooling:

```bash
bash vendor/devvly/2a-toolbox/scripts/install-2a.sh
```

This will place a `2a.sh` script in the root of your project.

---

### 2. Add the `2a` alias

To make using the toolbox easier, add the following alias to your shell configuration file (`~/.zshrc` or `~/.bashrc`):

```bash
alias 2a="bash ./2a.sh"
```

Then reload your shell:

```bash
source ~/.zshrc
# or
source ~/.bashrc
```

---

### 3. Initialize the project

Run the following command to set up the Docker environment files:

```bash
2a init
```

#### Optional flags:

- `--mail` – Adds Mailpit support
- `--tests` – Adds support for a test environment

---

## 🚀 Available Commands

After setup, you can use the following commands through the `2a` alias:

- `2a up` – Start the containers
- `2a down` – Stop the containers
- `2a artisan` – Run Laravel Artisan commands inside the container
- `2a cs` – Run Laravel Pint with the config located in `vendor/devvly/2a-toolbox/pint.json`

---

## 📦 Requirements

- Docker & Docker Compose
- Laravel project structure