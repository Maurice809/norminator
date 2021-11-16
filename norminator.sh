# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    norminator.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tmoret <marvin@42lausanne.ch>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/09 18:27:22 by tmoret            #+#    #+#              #
#    Updated: 2021/11/16 17:09:20 by tmoret           ###   ########.fr        #
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

# ajoute le void dans le main()
gsed -i 's/int\smain()/int main(void)/g' tempo2

# remplace le return(0)
gsed -i 's/return(0)/return (0)/g' tempo2

# remplace le char space par char tab
gsed -i 's/char\s/char\t/g' tempo2
gsed -i 's/,\schar\t/, char /g' tempo2
gsed -i 's/char\targc/char argc/g' tempo2
gsed -i 's/(char\s/(char /g' tempo2

# remplace le int space par int tab
gsed -i 's/int\s/int\t/g' tempo2
gsed -i 's/,\sint\t/, int /g' tempo2
gsed -i 's/int\targc/int argc/g' tempo2
gsed -i 's/(int\t/(int /g' tempo2

# remplace les pranthese
gsed -i 's/(\s/(/g' tempo2
gsed -i 's/\s)/)/g' tempo2

#remplace les =
gsed -i 's/\s=\s/BNK48/g' tempo2
gsed -i 's/\s!=\s/CGM48/g' tempo2
gsed -i 's/s\==\s/AKK48/g' tempo2
gsed -i 's/==/STU48/g' tempo2
gsed -i 's/s\<=\s/HKT48/g' tempo2
gsed -i 's/<=/SGO48/g' tempo2
gsed -i 's/=/ = /g' tempo2
gsed -i 's/HKT48/ <= /g' tempo2
gsed -i 's/SGO48/ <= /g' tempo2
gsed -i 's/BNK48/ = /g' tempo2
gsed -i 's/CGM48/ != /g' tempo2
gsed -i 's/AKB48/ == /g' tempo2
gsed -i 's/STU48/ == /g' tempo2

#remplace les ,
gsed -i 's/\s','\s/',' /g' tempo2

#remplace les while( par while (
gsed -i 's/while(/while (/g' tempo2

#remplace les if( par if (
gsed -i 's/if(/if (/g' tempo2

#remplce les +1 par + 1
gsed -i 's/+1/+ 1/g' tempo2

#supprime les espace en fin de ligne
gsed -i 's/ *$//' tempo2

# supprime la derniere ligne et inser un }
gsed -i '1d;$d' tempo2
echo "}" >> tempo2

# reconstitue le fichier
cat tempo tempo2 > $1

# destruction des fichier temporaire
rm tempo tempo2
