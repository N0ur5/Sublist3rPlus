## Note on Fork 

Let me start by saying I love Sublist3r. However one thing I find, especially during larger penetration testing engagements is that a number of the results tend to be dead links. I'm sure there's a number of reasons for why (e.g. link has since been moved, renamed, taken down, or was used in some online publication as an example subdomain that was never actually live). My goal (as a very amature python dev - which may even be an overstatment) is to add functionality to Sublist3r which will then ping the subdomains which are found to see which respond. There is always the chance something is live with ICMP off. But this is probably less common than the contrary. The end result will ideally be something like:

  -List of Subdomains that responded to ping, and ip they responded from
  
  -List of Subdomains that didn't respond to ping
  
  ## Update: 6/10/19
  
Sparradicly decided to nuke the forked code and am going my own direction with this, simply because as a n00b scripter, it is easier to start clean. I will learn more this way I believe to. Currently have succesfully spun up Google queries to find subdomains. Will be adding other search engines in over next few days. Then will build in extended functions (ping discovered subdomains, write to outfile, etc). 
