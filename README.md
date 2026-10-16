# Weekly API Runner

An automated **GitHub Actions** workflow that executes a Bash script every **Friday at midnight (00:00 UTC)** to sync data with WhatsApp API.

## 🚀 Features
*   **Fully Automated:** Runs on a strict `cron` schedule using GitHub-hosted runners.
*   **Secure:** Protects sensitive API credentials using GitHub Secrets.
*   **Robust Error Handling:** Checks HTTP status codes and terminates with proper exit codes on failure.

## 📂 Project Structure
*   `script.sh`: The core Bash script that packages payload data and sends the `POST` request using `curl`.
*   `.github/workflows/reminder.yml`: The GitHub Actions workflow configuration.

## 🛠️ Setup Instructions

### 1. Add your API Token
Do not hardcode your API key. You must save it as a GitHub Secret:
1. Go to this repository on GitHub and click **Settings**.
2. Navigate to **Secrets and variables** > **Actions**.
3. Click **New repository secret**.
4. Name: `MY_API_TOKEN`
5. Value: *[Your actual API token]*
6. Click **Add secret**.

### 2. Manual Testing
You don't have to wait until Friday to test it. 
1. Go to the **Actions** tab in this repository.
2. Select the **Weekly API Runner** workflow on the left.
3. Click the **Run workflow** dropdown menu and press the green button.
