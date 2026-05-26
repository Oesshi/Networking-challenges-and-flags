#!/bin/bash
ctfd_url="https://cbrc.ctfd.io/"
total_pins=10
individual_log="individual_pins.txt"
team_log="team_pins.txt"

calculate_progress() {
   local log_file=$1
   if [-f "$log_file" ]; then 
   Fallen=$(cat "$log_file' | wc -l | tr -d '[:space:]')
   Percent=$(echo "scale=2; ($Fallen / total_pins) * 100" | bc)
  echo "fallen: $Fallen / $total_pins ($Percent%)"
else
   echo "Fallen : 0 / $total_pins($Percent%)
fi

}

if [$1 == "knock"]; then 
   echo"$(date): pin fell" >> "$2"
   echo "Logged fallen pin to S2"
fi

echo "Individual Progress"
calculate_progress "$individual_pins"

echo "Team Progress"
calculate_progress "$team_pins"    #Tracking the progress of fallen pins and ones that are still standing 

# Generating a md5sum flag 
flag_input = challenge_flag_text
md5_flag =$(echo -n $flag_input | md5sum | awk '{print $1}' )

echo "The flag you generated is : md5_flag"


# Increasing/decrease points on ctfd 
ctfd_url="https://cbrc.ctfd.io/"
challenge_id="<your_challenge_id">
api_token="${ctfd_token}"

adjustment_value=50

current_value=$(curl -s -x Get"${ctfd_id}/challenges/${challenge_id}"
    -H "Authorisation: token ${api_token}"\
    -H "Content_type : application/json" \
    -d "{\value\" : ${New_value}}"
echo "Successfully updated challenge ${challenge_id} from ${current_value} to ${new_value} points"

#Linux commands 
#!/bin/bash
compgen -c | grep -E  '^(ls|cat|cd|ls -la| ls -l|)^'
