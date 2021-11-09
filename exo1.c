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

int affiche(int *tableau, int taille_tableau)
{
  int valeur;
  int i;
  valeur = 0;
  i=0;
  while(i != taille_tableau )
  {
    valeur = valeur + tableau[i];
    ++i;
  }
  return (valeur);
}

int main(int argc, char *argv[])
{
  int taille_tableau;
  int tableau[taille_tableau];
  int i;
  int somme_total;

  taille_tableau = argc - 1;
  
  i=0;
  while (i != taille_tableau )
  {
    tableau[i] = atoi(argv[i +1]);
    printf("tableau[%i] : %i\n", i, tableau[i]);
    ++i;
  }
  somme_total = affiche(tableau , taille_tableau);
  printf("la somme total : %i\n", somme_total);
}