# Pipe my public key to my clipboard.
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias gitkey="more ~/Documents/Keys/git.txt | pbcopy | echo '=> Git key copied to pasteboard.'"