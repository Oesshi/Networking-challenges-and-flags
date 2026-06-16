
ctfd_url="https://cbrc.ctfd.io/"
total_pins=10
individual_log="individual_pins.txt"
team_log="team_pins.txt"

calculate_progress() {
    local log_file=$1
    if [ -f "$log_file" ]; then
        Fallen=$(wc -l < "$log_file" | tr -d '[:space:]')
        Percent=$(echo "scale=2; ($Fallen / $total_pins) * 100" | bc)
        echo "Fallen: $Fallen / $total_pins ($Percent%)"
    else
        echo "Fallen: 0 / $total_pins (0%)"
    fi
}

# Log a fallen pin
if [ "$1" == "knock" ]; then
    echo "$(date): pin fell" >> "$2"
    echo "Logged fallen pin to $2"
fi

echo "Individual Progress"
calculate_progress "$individual_log"

echo "Team Progress"
calculate_progress "$team_log"

# Generate MD5 flag
flag_input="challenge_flag_text"
md5_flag=$(echo -n "$flag_input" | md5sum | awk '{print $1}')
echo "The flag you generated is: $md5_flag"

# Update CTFd challenge points
challenge_id="<your_challenge_id>"
api_token="${ctfd_token}"
adjustment_value=50

# Example GET request (fixed)
current_value=$(curl -s \
    -H "Authorization: Token ${api_token}" \
    "${ctfd_url}/api/v1/challenges/${challenge_id}" | jq '.data.value')

new_value=$((current_value + adjustment_value))

curl -s -X PATCH \
    -H "Authorization: Token ${api_token}" \
    -H "Content-Type: application/json" \
    -d "{\"value\": ${new_value}}" \    "${ctfd_url}/api/v1/challenges/${challenge_id}" >/dev/null

echo "Successfully updated challenge ${challenge_id} from ${current_value} to ${new_value} points"

# Allowed Linux commands
compgen -c | grep -E '^(ls|cat|cd)( |$)'


