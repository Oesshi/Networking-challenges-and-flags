# link to ctfd 
#!/bin/bash
ctfd_url=https://cbrc.ctfd.io/ 


#hiding and creating a file, generate flag 
secret_file=".hidden_pinflag"
score_file="scores.txt"

touch "$secret_file"
date +%s > "$secret_file"

md5_sum_flag=$(md5sum "$secret_file" | awk '{print $1]')
echo "Generated md5 Flag: $md5_sum_flag"


# increase/decrease points 
if [! -f "$score_file"]; then 
  cat << 'eof' > "$score_file"
 Team_player:100:team
 Team_player:150:team
 Player_one:50:individual
 player_two:50:individual
 eof 
 fi 

 update_score() {
   local target="$1"
   local change="$2"
if grep -q "^$target:" "$score_file"; then 
  local current_pts=$(grep "^$target:" "$score_file" | cut -d: -f2)
  local new_pts=$((current_pts + change))

 sed -i "s/^$target:[0-9]*:/$target:$new_pts:/g"  "$score_file"
 echo "Successfully updated scores for $target. New score: "$new_pts"
else
   echo 'Error: $target not found in $score_file"
 fi 

}

update_score "player_one" 10
update_score "Team_player" -20

echo "Current scores for individual or team" 
cat $score_file" 

#linux commands 

command_array($(compgen -c))
