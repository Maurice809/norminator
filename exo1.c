/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   exo1.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tmoret <tmoret@student.42lausanne.ch>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/11/09 11:15:37 by tmoret            #+#    #+#             */
/*   Updated: 2021/11/09 11:15:41 by tmoret           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include<stdio.h>
#include <stdlib.h>
#include <string.h>

int affiche(int *tableau, int tailleTableau)
{
  int valeur;
  int i;
  valeur = 0;
  i=0;
  while(i != tailleTableau )
  {
    valeur = valeur + tableau[i];
    ++i;
  }
  return (valeur);
}

int main(int argc, char *argv[])
{
  int tailleTableau;
  int tableau[tailleTableau];
  int i;
  int sommeTotal;

  tailleTableau = argc - 1;
  
  i=0;
  while (i != tailleTableau )
  {
    tableau[i] = atoi(argv[i +1]);
    printf("tableau[%i] : %i\n", i, tableau[i]);
    ++i;
  }
  sommeTotal = affiche(tableau , tailleTableau);
  printf("la somme total : %i\n", sommeTotal);
}