# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminator.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoret <marvin@42lausanne.ch>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/09 18:27:22 by tmoret            #+#    #+#              #
#    Updated: 2021/11/09 23:18:13 by tmoret           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

# decoupe le header
gsed '1,12!d' $1 > tempo

# renome le fichier tempo
mv $1 tempo2

# Applique le formatage norminette

# decoupe le fichier 
gsed -i '12,$!d' tempo2

# remplace 2 espace par un tab
gsed -i 's/\s\s/\t/g' tempo2

# remplace le int space par int tab
gsed -i 's/int\s/int\t/g' tempo2
gsed -i 's/,\sint\t/, int /g' tempo2
gsed -i 's/int\targc/int argc/g' tempo2
gsed -i 's/(\s/(/g' tempo2
gsed -i 's/\s)/)/g' tempo2
gsed -i 's/\s=\s/BNK48/g' tempo2
gsed -i 's/\s!=\s/CGM48/g' tempo2
gsed -i 's/=/ = /g' tempo2
gsed -i 's/BNK48/ = /g' tempo2
gsed -i 's/CGM48/ != /g' tempo2
gsed -i 's/\s','\s/',' /g' tempo2
gsed -i 's/while(/while (/g' tempo2
gsed -i 's/+1/+ 1/g' tempo2

#supprime les espace en fin de ligne
gsed -i 's/ *$//' tempo2

# supprime la derniere ligne et inser un }
gsed -i '1d;$d' tempo2
echo "}" >> tempo2

# reconstitue le fichier
cat tempo tempo2 > $1

