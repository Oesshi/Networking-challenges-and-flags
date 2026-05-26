# link to ctfd 
#!/bin/bash
ctfd_url=https://cbrc.ctfd.io/ 
challenge_name="Bowlingpinchallenge2.sh"
score_mode="individual"
individual_points=75
team_points=300

total_pins=10
pins_fallen=0

if ["$Score_Mode" = "team"]; then 
   Total_points=$team_points
else
    Total_points=$individual_points
fi

pins_left=$((total_pins - pins_fallen))
pin_percent=$(( (pins_fallen * 100) / total_pins ))

# create a file and hide 
Hidden_file_name=".bowlingflag.log"
{  
 echo "==Game log data=="
 echo "Target hash: $final_flag"
 echo "Game mode: $score_mode"
 echo "Current score: $total_points"
 echo "message - $pins_fallen pins down, $pins_left remaining"
} > $Hidden_file_name

# Generate a flag inside the file 
Flag_hash=$(echo -n "Strike_spare_secret_flag" | md5sum | awk '{print $1}')
final_flag="flag{$Flag_hash}"

# Linux commands 
compgen -c | grep -E '^(find|locate|whereis|ls|cd|mkdir)$'


