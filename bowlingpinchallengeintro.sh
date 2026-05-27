# link to ctfd 
ctfd_url=https://cbrc.ctfd.io/  
challenge_name="bowlingpinchallengeintro.sh"

score_mode="team"
individual_points=75
team_points=300

total_pins=10
if ["$score_mode" = "team" ]; then 
   total_points=$team_points
else
    total_points=$individual_points
fi
# generate a flag using md5sum 
flag_hash=$(echo -n "Strike_spare_secret_flag" | md5sum | awk '{print $1}')
final_flag="flag{$flag_hash}"

hidden_file_name=".bowlingpinflag.txt"

#increase/ decreae points 
calculate_progress() {
   local log_file=$1
if [-f "$log_file"]; then 
   Fallen=$(cat 'log_file' | wc -l | tr -d '[:space:]')
   Percent=$(echo "scale=2; ($Fallen / total_pins) * 100" | bc)
   echo "fallen: SFallen / total_pins($Percent%)"
else
    echo "Fallen: 0 / $total_pins($Percent%)"
fi
}

if [$1 == "knock"]; then 
  echo "$(date): pin fell" >> "$2"
  echo "Logged fallen pin to $2"
fi

echo "Individual Progress"
calculate_progress "$individual_pins"

echo "Team progress"
calculate_progress "$team_pins" 

#linux commands 

compgen -c | grep -E '^(ls|cat|cd|ls -la|ls -l|)^'
