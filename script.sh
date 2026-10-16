#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting the weekly API call..."

# Check if the API token is present
if [ -z "$EB_TOKEN" ]; then
    echo "Error: EB_TOKEN environment variable is not set."
    exit 1
fi

JQ_PAYLOAD=$(jq -n \
--arg username "$EB_USERNAME" \
--arg token "$EB_TOKEN" \
--arg msg "$WA_MSG" \
--arg recipients "$WA_RECIPIENTS" \
'{
    WA: {
        auth: { username: $username, apikey: $token }, 
        message: { subject: "Title for dashboard ONLY", messagetext: $msg }, 
        recipients: [$recipients]
    }
}')



# Call the sample API
RESPONSE=$(curl -s -w "\n%{http_code}" \
  -X POST "https://api.ebulksms.com/sendwhatsapp.json" \
  -H "Content-Type: application/json" \
  -d "$JQ_PAYLOAD")


# Separate the body and the HTTP status code
HTTP_BODY=$(echo "$RESPONSE" | sed '$d')
HTTP_STATUS=$(echo "$RESPONSE" | tail -n1)

# Check the response status
if [ "$HTTP_STATUS" -eq 200 ] || [ "$HTTP_STATUS" -eq 201 ]; then
    echo "Success! API responded with status $HTTP_STATUS"
    echo "Response: $HTTP_BODY"
else
    echo "Failed! API responded with status $HTTP_STATUS"
    echo "Error Response: $HTTP_BODY"
    exit 1
fi