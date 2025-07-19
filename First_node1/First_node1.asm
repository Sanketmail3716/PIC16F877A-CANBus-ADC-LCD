
_main:

;First_node1.c,31 :: 		void main() {
;First_node1.c,32 :: 		ADCON1 = 0x80; // AN0 analog
	MOVLW      128
	MOVWF      ADCON1+0
;First_node1.c,33 :: 		TRISA = 0xFF;  // Input
	MOVLW      255
	MOVWF      TRISA+0
;First_node1.c,35 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;First_node1.c,36 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;First_node1.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;First_node1.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;First_node1.c,39 :: 		Lcd_Out(1,1,"Node A Sending");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_First_node1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;First_node1.c,41 :: 		Can_Send_Flags = _CANSPI_TX_PRIORITY_0 & _CANSPI_TX_XTD_FRAME & _CANSPI_TX_NO_RTR_FRAME;
	MOVLW      244
	MOVWF      _Can_Send_Flags+0
;First_node1.c,44 :: 		_CANSPI_CONFIG_VALID_XTD_MSG & _CANSPI_CONFIG_LINE_FILTER_OFF;
	MOVLW      209
	MOVWF      _Can_Init_Flags+0
;First_node1.c,46 :: 		CANSPIInitialize(1,3,3,3,1,Can_Init_Flags);
	MOVLW      1
	MOVWF      FARG_CANSPIInitialize_SJW+0
	MOVLW      3
	MOVWF      FARG_CANSPIInitialize_BRP+0
	MOVLW      3
	MOVWF      FARG_CANSPIInitialize_PHSEG1+0
	MOVLW      3
	MOVWF      FARG_CANSPIInitialize_PHSEG2+0
	MOVLW      1
	MOVWF      FARG_CANSPIInitialize_PROPSEG+0
	MOVLW      209
	MOVWF      FARG_CANSPIInitialize_CANSPI_CONFIG_FLAGS+0
	CALL       _CANSPIInitialize+0
;First_node1.c,47 :: 		CANSPISetOperationMode(_CANSPI_MODE_CONFIG,0xFF);
	MOVLW      128
	MOVWF      FARG_CANSPISetOperationMode_mode+0
	MOVLW      255
	MOVWF      FARG_CANSPISetOperationMode_WAIT+0
	CALL       _CANSPISetOperationMode+0
;First_node1.c,48 :: 		CANSPISetMask(_CANSPI_MASK_B1,-1,_CANSPI_CONFIG_XTD_MSG);
	CLRF       FARG_CANSPISetMask_CANSPI_MASK+0
	MOVLW      255
	MOVWF      FARG_CANSPISetMask_val+0
	MOVLW      255
	MOVWF      FARG_CANSPISetMask_val+1
	MOVWF      FARG_CANSPISetMask_val+2
	MOVWF      FARG_CANSPISetMask_val+3
	MOVLW      247
	MOVWF      FARG_CANSPISetMask_CANSPI_CONFIG_FLAGS+0
	CALL       _CANSPISetMask+0
;First_node1.c,49 :: 		CANSPISetMask(_CANSPI_MASK_B2,-1,_CANSPI_CONFIG_XTD_MSG);
	MOVLW      1
	MOVWF      FARG_CANSPISetMask_CANSPI_MASK+0
	MOVLW      255
	MOVWF      FARG_CANSPISetMask_val+0
	MOVLW      255
	MOVWF      FARG_CANSPISetMask_val+1
	MOVWF      FARG_CANSPISetMask_val+2
	MOVWF      FARG_CANSPISetMask_val+3
	MOVLW      247
	MOVWF      FARG_CANSPISetMask_CANSPI_CONFIG_FLAGS+0
	CALL       _CANSPISetMask+0
;First_node1.c,50 :: 		CANSPISetFilter(_CANSPI_FILTER_B2_F3,ID_2nd,_CANSPI_CONFIG_XTD_MSG);
	MOVLW      4
	MOVWF      FARG_CANSPISetFilter_CANSPI_FILTER+0
	MOVLW      113
	MOVWF      FARG_CANSPISetFilter_val+0
	MOVLW      43
	MOVWF      FARG_CANSPISetFilter_val+1
	MOVLW      0
	MOVWF      FARG_CANSPISetFilter_val+2
	MOVLW      0
	MOVWF      FARG_CANSPISetFilter_val+3
	MOVLW      247
	MOVWF      FARG_CANSPISetFilter_CANSPI_CONFIG_FLAGS+0
	CALL       _CANSPISetFilter+0
;First_node1.c,51 :: 		CANSPISetOperationMode(_CANSPI_MODE_NORMAL,0xFF);
	CLRF       FARG_CANSPISetOperationMode_mode+0
	MOVLW      255
	MOVWF      FARG_CANSPISetOperationMode_WAIT+0
	CALL       _CANSPISetOperationMode+0
;First_node1.c,53 :: 		while(1){
L_main0:
;First_node1.c,54 :: 		adc_value_1 = ADC_Read(0); // 10-bit ADC
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value_1+0
	MOVF       R0+1, 0
	MOVWF      _adc_value_1+1
;First_node1.c,56 :: 		RxTx_Data[0] = adc_value_1 >> 8;     // MSB
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      _RxTx_Data+0
;First_node1.c,57 :: 		RxTx_Data[1] = adc_value_1 & 0xFF;   // LSB
	MOVLW      255
	ANDWF      R0+0, 0
	MOVWF      _RxTx_Data+1
;First_node1.c,58 :: 		Lcd_Out(1,1,"Node2:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_First_node1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;First_node1.c,59 :: 		Lcd_Cmd(0x86);
	MOVLW      134
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;First_node1.c,60 :: 		Lcd_Chr_Cp(adc_value_1/1000+'0');
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _adc_value_1+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,61 :: 		Lcd_Chr_Cp(((adc_value_1/100)%10)+'0');
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_1+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,62 :: 		Lcd_Chr_Cp(((adc_value_1/10)%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_1+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,63 :: 		Lcd_Chr_Cp((adc_value_1%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_1+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,64 :: 		Lcd_Out(1,11,"     ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_First_node1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;First_node1.c,65 :: 		CANSPIWrite(ID_1st, RxTx_Data, 2, Can_Send_Flags); // Send to Node B
	MOVLW      79
	MOVWF      FARG_CANSPIWrite_id+0
	MOVLW      47
	MOVWF      FARG_CANSPIWrite_id+1
	MOVLW      0
	MOVWF      FARG_CANSPIWrite_id+2
	MOVLW      0
	MOVWF      FARG_CANSPIWrite_id+3
	MOVLW      _RxTx_Data+0
	MOVWF      FARG_CANSPIWrite_wr_data+0
	MOVLW      2
	MOVWF      FARG_CANSPIWrite_data_len+0
	MOVF       _Can_Send_Flags+0, 0
	MOVWF      FARG_CANSPIWrite_CANSPI_TX_MSG_FLAGS+0
	CALL       _CANSPIWrite+0
;First_node1.c,66 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;First_node1.c,67 :: 		adc_value_2 = ADC_Read(3); // 10-bit ADC
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value_2+0
	MOVF       R0+1, 0
	MOVWF      _adc_value_2+1
;First_node1.c,69 :: 		RxTx_Data[0] = adc_value_2 >> 8;     // MSB
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      _RxTx_Data+0
;First_node1.c,70 :: 		RxTx_Data[1] = adc_value_2 & 0xFF;   // LSB
	MOVLW      255
	ANDWF      R0+0, 0
	MOVWF      _RxTx_Data+1
;First_node1.c,71 :: 		Lcd_Out(2,1,"Node1:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_First_node1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;First_node1.c,72 :: 		Lcd_Cmd(0xC6);
	MOVLW      198
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;First_node1.c,73 :: 		Lcd_Chr_Cp(adc_value_2/1000+'0');
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _adc_value_2+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,74 :: 		Lcd_Chr_Cp(((adc_value_2/100)%10)+'0');
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_2+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,75 :: 		Lcd_Chr_Cp(((adc_value_2/10)%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_2+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,76 :: 		Lcd_Chr_Cp((adc_value_2%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _adc_value_2+0, 0
	MOVWF      R0+0
	MOVF       _adc_value_2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;First_node1.c,77 :: 		Lcd_Out(1,11,"     ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_First_node1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;First_node1.c,78 :: 		CANSPIWrite(ID_2nd, RxTx_Data, 2, Can_Send_Flags); // Send to Node B
	MOVLW      113
	MOVWF      FARG_CANSPIWrite_id+0
	MOVLW      43
	MOVWF      FARG_CANSPIWrite_id+1
	MOVLW      0
	MOVWF      FARG_CANSPIWrite_id+2
	MOVLW      0
	MOVWF      FARG_CANSPIWrite_id+3
	MOVLW      _RxTx_Data+0
	MOVWF      FARG_CANSPIWrite_wr_data+0
	MOVLW      2
	MOVWF      FARG_CANSPIWrite_data_len+0
	MOVF       _Can_Send_Flags+0, 0
	MOVWF      FARG_CANSPIWrite_CANSPI_TX_MSG_FLAGS+0
	CALL       _CANSPIWrite+0
;First_node1.c,79 :: 		Delay_ms(100);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;First_node1.c,80 :: 		}
	GOTO       L_main0
;First_node1.c,81 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
