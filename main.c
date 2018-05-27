#include <avr/io.h>
#include <avr/interrupt.h>

uint8_t CURRENT;

ISR(TIMER0_COMPA_vect)
{
	PORTA = (1 << CURRENT);
	CURRENT = (CURRENT + 1) % 7;
}

int main(void)
{
    DDRA = 0xFF;    
    CURRENT = 0;
    
    TCCR0A |= (1 << CTC0);
    
    //~ TCCR0B |= (1 << CS00); // no prescaler
    TCCR0B |= (1 << CS02) | (1 << CS00); //1024 prescaler
    
    TIMSK |= (1 << OCIE0A);
    
    OCR0A = 255;
    
    sei();
    
    while (1)
    {
		
	}
    return 0;
}


