#line 1 "G:/My Drive/Envision/PIC Microcontroller/MikroC/CAN/Three_Node_2ADC/First_node1/First_node1.c"

sbit LCD_RS at RC0_bit;
sbit LCD_EN at RC1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISC0_bit;
sbit LCD_EN_Direction at TRISC1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;


sbit CanSpi_CS at RC2_bit;
sbit CanSpi_CS_Direction at TRISC2_bit;
sbit CanSpi_Rst at RC6_bit;
sbit CanSpi_Rst_Direction at TRISC6_bit;

unsigned char Can_Init_Flags, Can_Send_Flags, Can_Rcv_Flags;
unsigned char Rx_Data_Len;
char RxTx_Data[8];
char Msg_Rcvd;
const long ID_1st = 12111, ID_2nd = 11121;
long Rx_ID;
unsigned int adc_value_1, adc_value_2;


void main() {
 ADCON1 = 0x80;
 TRISA = 0xFF;

 SPI1_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Node A Sending");

 Can_Send_Flags = _CANSPI_TX_PRIORITY_0 & _CANSPI_TX_XTD_FRAME & _CANSPI_TX_NO_RTR_FRAME;
 Can_Init_Flags = _CANSPI_CONFIG_SAMPLE_THRICE & _CANSPI_CONFIG_PHSEG2_PRG_ON &
 _CANSPI_CONFIG_XTD_MSG & _CANSPI_CONFIG_DBL_BUFFER_ON &
 _CANSPI_CONFIG_VALID_XTD_MSG & _CANSPI_CONFIG_LINE_FILTER_OFF;

 CANSPIInitialize(1,3,3,3,1,Can_Init_Flags);
 CANSPISetOperationMode(_CANSPI_MODE_CONFIG,0xFF);
 CANSPISetMask(_CANSPI_MASK_B1,-1,_CANSPI_CONFIG_XTD_MSG);
 CANSPISetMask(_CANSPI_MASK_B2,-1,_CANSPI_CONFIG_XTD_MSG);
 CANSPISetFilter(_CANSPI_FILTER_B2_F3,ID_2nd,_CANSPI_CONFIG_XTD_MSG);
 CANSPISetOperationMode(_CANSPI_MODE_NORMAL,0xFF);

 while(1){
 adc_value_1 = ADC_Read(0);

 RxTx_Data[0] = adc_value_1 >> 8;
 RxTx_Data[1] = adc_value_1 & 0xFF;
 Lcd_Out(1,1,"Node2:");
 Lcd_Cmd(0x86);
 Lcd_Chr_Cp(adc_value_1/1000+'0');
 Lcd_Chr_Cp(((adc_value_1/100)%10)+'0');
 Lcd_Chr_Cp(((adc_value_1/10)%10)+'0');
 Lcd_Chr_Cp((adc_value_1%10)+'0');
 Lcd_Out(1,11,"     ");
 CANSPIWrite(ID_1st, RxTx_Data, 2, Can_Send_Flags);
 Delay_ms(100);
 adc_value_2 = ADC_Read(3);

 RxTx_Data[0] = adc_value_2 >> 8;
 RxTx_Data[1] = adc_value_2 & 0xFF;
 Lcd_Out(2,1,"Node1:");
 Lcd_Cmd(0xC6);
 Lcd_Chr_Cp(adc_value_2/1000+'0');
 Lcd_Chr_Cp(((adc_value_2/100)%10)+'0');
 Lcd_Chr_Cp(((adc_value_2/10)%10)+'0');
 Lcd_Chr_Cp((adc_value_2%10)+'0');
 Lcd_Out(1,11,"     ");
 CANSPIWrite(ID_2nd, RxTx_Data, 2, Can_Send_Flags);
 Delay_ms(100);
 }
}
