#include <stdio.h>

int main(void) {
    int age = 0;
    float height = 0.0f;
    char initial = '\0';

    printf("Enter your age: ");
    scanf("%d", &age);

    printf("Enter your height in meters: ");
    scanf("%f", &height);

    printf("Enter the first letter of your name: ");
    scanf(" %c", &initial);

    printf("\nSummary\n");
    printf("Age: %d\n", age);
    printf("Height: %.2f m\n", height);
    printf("Initial: %c\n", initial);

    return 0;
}
