/*********************************************************************
*                                                                    *
*  This file is part of PRUEBA1.                                     *
*                                                                    *
*  PRUEBA1 is free software: you can redistribute it                 *
*  and/or modify it under the terms of the GNU General Public        *
*  License as published by the Free Software Foundation, either      *
*  version 3 of the License, or (at your option) any later version.  *
*                                                                    *
*  PRUEBA1 is distributed in the hope that it will be useful,        *
*                                                                    *
*  but WITHOUT ANY WARRANTY; without even the implied warranty of    *
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     *
*  GNU General Public License for more details.                      *
*                                                                    *
*  You should have received a copy of the GNU General Public License *
*  along with PRUEBA1.                                               *
*  If not, see <http://www.gnu.org/licenses/>.                       *
*                                                                    *
**********************************************************************
*                                                                    *
* @ARCHIVO: main.c                                                   *
*                                                                    *
* @DESCRIPCIÓN:                                                      *
*                                                                    *
* @AUTOR: PBL <pbl@opmbx.org>                                        *
*                                                                    *
**********************************************************************/



/*********************************************************************
*    INCLUDES                                                        *
**********************************************************************/
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

#include "hola.h"
#include "adios.h"
#include "main.h"

/*********************************************************************
*    VARIABLES                                                       *
**********************************************************************/


/*********************************************************************
*    FUNCIONES                                                       *
**********************************************************************/
int main(int argc, char *argv[])
{
  InfoPrograma();

    FuncHola();

    /* Espera(); */

    printf("Se vuelve a escribir en la pantalla después de esperar un tiempo\n");


    return 0;
}

void InfoPrograma(void){
  system("clear");

  printf("Prueba1\n Versión:%d.%d.%db%d\n Fecha de compilación: %s\n",MAJOR_VER,MINOR_VER,PATCH_VER,BUILD_VER,FECHA_VER);

  return;
}


/*************************** END OF FILE ****************************/
