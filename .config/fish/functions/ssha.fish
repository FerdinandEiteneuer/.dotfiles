function ssha

	eval (ssh-agent -c)

	ssh-add ~/.ssh/id_rsa_github	
	
end
