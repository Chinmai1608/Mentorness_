# 3. IPL Analysis with Tableau 
The goal of this Power BI project is to analyze IPL (Indian Premier League) cricket data to gain insights into team and player performance, match outcomes, and various key metrics related to both batting and bowling. The analysis will be carried out using data from multiple related tables, providing a comprehensive view of the tournament's dynamics.

### Data Sources:
#### 1. Fact Bowling
o Columns Description:
▪ match_id: Unique identifier for the match.
▪ match: Description or name of the match.
▪ bowlingTeam: Name of the team that is bowling.
▪ bowlerName: Name of the bowler.
▪ overs: Number of overs bowled by the bowler.
▪ maiden: Number of maiden overs bowled.
▪ runs: Runs conceded by the bowler.
▪ wickets: Wickets taken by the bowler.
▪ economy: Economy rate of the bowler.
▪ 0s: Number of dot balls bowled.
▪ 4s: Number of fours conceded.
▪ 6s: Number of sixes conceded.
▪ wides: Number of wide balls bowled.
▪ noBalls: Number of no balls bowled.

#### 2. Fact Batting Summary
o Columns Description:
▪ match_id: Unique identifier for the match.
▪ match: Description or name of the match.
▪ teamInnings: The team batting in the innings.
▪ battingPos: Batting position of the player.
▪ batsmanName: Name of the batsman.
▪ out/not_out: Whether the batsman was out or not out.
▪ runs: Runs scored by the batsman.
▪ balls: Balls faced by the batsman.
▪ 4s: Number of fours hit.
▪ 6s: Number of sixes hit.
▪ SR: Strike rate of the batsman.

#### 3. Dim Player
o Columns Description:
▪ name: Name of the player.
▪ team: Team the player belongs to.
▪ battingStyle: Batting style of the player (e.g., Right-hand bat).
▪ bowlingStyle: Bowling style of the player (e.g., Right-arm fast).
▪ playingRole: Role of the player (e.g., Batsman, Bowler).

#### 4. Dim Match Summary
o Columns Description:
▪ team1: Name of the first team.
▪ team2: Name of the second team.
▪ winner: Winner of the match.
▪ margin: Margin of victory.
▪ matchDate: Date of the match.
▪ match_id: Unique identifier for the match.

### Dashboard Analysis
<div class='tableauPlaceholder' id='viz1721238997515' style='position: relative'>
 <noscript><a href='https://public.tableau.com/views/IPLDataAnalysisMentorness/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link'><img alt='IPL DATA ANALYSIS DASHBOARD ' src='https://github.com/user-attachments/assets/e68a482a-9854-4867-93f2-9ee28a60fc7c' style='border: none' /></a></noscript>   

 
***
<div align='center'>
<noscript><a href='#'><img alt='logo' src='https://github.com/user-attachments/assets/8cc3be12-83a3-44dc-b598-a54211cfb919' style='border: none' /></a></noscript>
</div>

