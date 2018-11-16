/*
    Print out hex values of bytes of the input file 
*/

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
    FILE *in = NULL;
    int c = 0, i = 0;
    long long offset = 0;
    long long bytes2read = 0;

    if (4 != argc)
    {
        printf("Usage %s <input file> <-offset from the end/0/offset from the begining> <number of bytes to print>\n", argv[0]);
        exit(-1);
    }

    if (NULL == (in=fopen(argv[1], "rb")))
    {
        perror("in file open error");
        exit(-1);
    }

    offset = atoi(argv[2]);
    if (0 == offset)
    {
        /* do nothing */
    }
    else if (0 < offset)
    {
        if ( -1 == fseek(in, offset, SEEK_SET))
        {
            perror("fseek error");
            exit(-1);
        }
    }
    else 
    {
         if ( -1 == fseek(in, offset, SEEK_END))
        {
            perror("fseek error");
            exit(-1);
        }
    }

    bytes2read = atoi(argv[3]);
    i = 0;
    while ( i < bytes2read && !feof(in) )
    {
        c = fgetc(in);
        printf("%02x", c);
        i++;
    }
    printf("\n");

    fclose(in);
    return 0;
}