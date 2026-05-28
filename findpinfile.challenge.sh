# link to ctfd
#!/bin/bash
ctfd_url="https://cbrc.ctfd.io/"

# generating a flag, create file and include generated flag, store in a directory 
touch .bowling_pin_file
md5sum .bowling_pin_file > /path/to/directory/checkfile.txt
md5sum -c /path/to/directory/checkfile.txt


# linux commands 
compgen -a 

#increase/decrease points 
player_score=0
team_score=0
((player_score++10))
((team_score++10))
((player_score--5))
((team_score--5))

echo $player_score 
echo $team_score
