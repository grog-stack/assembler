#ifndef STRINGS_C
#define STRINGS_C

#define STR_END '\0'
#define STR_NOT_FOUND -1

// returns the position of a char in a string, or STRINGS_NOT_FOUND if not found
int str_first_occurrence(char *str, char c){
    int i = 0;
    while (str[i] != STR_END && str[i] != c) {
        i++;
    }
    return str[i] == c ? i : STR_NOT_FOUND;
} 

#endif