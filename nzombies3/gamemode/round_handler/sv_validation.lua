//

function nz.Rounds.Functions.CheckReady()

	local count = 0
	local total = 0
	
	//Get the total number of players that are willing
	for k,v in pairs(player.GetAll()) do
		if !v:IsPermSpec() then
			total = total + 1
		end
	end
	//Get the total of ready players
	for k,v in pairs(player.GetAll()) do
		if v.Ready and v:IsValid() and !v:IsPermSpec() then
			count = count + 1
		else
			v.Ready = false
		end
	end
	print("Waiting for players: " .. count .. " / " .. total)
	if count / total < 0.66 then
		return false
	end
	
	return true
	
end

function nz.Rounds.Functions.CheckAlive()

	//Check alive players!
	for k,v in pairs(team.GetPlayers(TEAM_PLAYERS)) do
		-- Players with Who's Who will not count towards losing the game just yet!
		if v:Alive() and (v:GetNotDowned() or v.HasWhosWho) then
			return true
		end
	end
	
	return false
end

function nz.Rounds.Functions.IsInGame()
	return (nz.Rounds.Data.CurrentState == ROUND_PROG or nz.Rounds.Data.CurrentState == ROUND_PREP)
end