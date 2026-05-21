!/bin/bash
ctfd_url="https://cbrc.ctfd.io"
team_token="Player-unique-token"
initial_points=200
min_points=10
pin_value=50

pins_hit=0
function report_progress(){  #Tracks the progress of fallen pins 

# Generating a md5sum flag 

challenge_name="Bowlingpinchallenge.os" 
> "$challenge_name"
echo "Generating md5 flags for files" 

for file in *; do
if [[-f "$file" && "$file" != "$challenge_name" ]]: then 
md5sum "$file" >> "$challenge_name"
echo "Processed : $file"
fi 
done 


# Increasing/decrease points on ctfd 
pins_hit=0
function report_progress(){  #Tracks the progress of fallen pins 

echo "Reporting Pin $1 knocked down"
}
while true; do
if [-f"/tmp/pin_1_knocked"]; then # records the number of pins fallen 
((pins_hit++))
report_progress $pins_hit #points are given if the player gets the answer correct 
rm /tmp/pin_1_knocked
fi 
if [-f "/tmp/penalty"]: then 
echo "Penalty detected : Reducing potential points." # losing points for the player 
fi 
sleep 5 
done 
