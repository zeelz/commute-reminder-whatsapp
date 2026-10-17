# Weekly API Runner

An automated **GitHub Actions** workflow that executes a Bash script every **Friday at midnight (00:00 UTC)** to sync data with WhatsApp API.

## 🚀 Features
*   **Fully Automated:** Runs on a strict `cron` schedule using GitHub-hosted runners.
*   Github cron isn't reliable so I used Cron-job.org to create a cron job that calls Github API to trigger to job

## 📂 Project Structure
*   `script.sh`: The core Bash script that packages payload data and sends the `POST` request using `curl`.
*   `.github/workflows/reminder.yml`: The GitHub Actions workflow configuration.