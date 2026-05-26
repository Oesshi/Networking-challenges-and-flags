# link to ctfd 
ctfd_url=https://cbrc.ctfd.io/  
challenge_name="bowlingpinchallengeintro.sh"

score_mode="team"
individual_points=75
team_points=300

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



#linux commands 
