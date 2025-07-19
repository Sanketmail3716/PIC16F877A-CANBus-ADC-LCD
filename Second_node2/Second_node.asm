
_main:

;Second_node.c,31 :: 		void main() {
;Second_node.c,32 :: 		ADCON1 = 0x80; // Configure AN0-AN1 as analog
	MOVLW      128
	MOVWF      ADCON1+0
;Second_node.c,33 :: 		TRISA = 0xFF;  // AN1 input on RA1
	MOVLW      255
	MOVWF      TRISA+0
;Second_node.c,35 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;Second_node.c,36 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Second_node.c,37 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Second_node.c,38 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Second_node.c,39 :: 		Lcd_Out(1,1,"Node B ADC CAN");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Second_node+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Second_node.c,41 :: 		Can_Send_Flags = _CANSPI_TX_PRIORITY_0 & _CANSPI_TX_XTD_FRAME & _CANSPI_TX_NO_RTR_FRAME;
	MOVLW      244
	MOVWF      _Can_Send_Flags+0
;Second_node.c,44 :: 		_CANSPI_CONFIG_VALID_XTD_MSG & _CANSPI_CONFIG_LINE_FILTER_OFF;
	MOVLW      209
	MOVWF      _Can_Init_Flags+0
;Second_node.c,46 :: 		CANSPIInitialize(1,3,3,3,1,Can_Init_Flags);
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
;Second_node.c,47 :: 		CANSPISetOperationMode(_CANSPI_MODE_CONFIG,0xFF);
	MOVLW      128
	MOVWF      FARG_CANSPISetOperationMode_mode+0
	MOVLW      255
	MOVWF      FARG_CANSPISetOperationMode_WAIT+0
	CALL       _CANSPISetOperationMode+0
;Second_node.c,48 :: 		CANSPISetMask(_CANSPI_MASK_B1,-1,_CANSPI_CONFIG_XTD_MSG);
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
;Second_node.c,49 :: 		CANSPISetMask(_CANSPI_MASK_B2,-1,_CANSPI_CONFIG_XTD_MSG);
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
;Second_node.c,50 :: 		CANSPISetFilter(_CANSPI_FILTER_B2_F3,ID_1st,_CANSPI_CONFIG_XTD_MSG);
	MOVLW      4
	MOVWF      FARG_CANSPISetFilter_CANSPI_FILTER+0
	MOVLW      79
	MOVWF      FARG_CANSPISetFilter_val+0
	MOVLW      47
	MOVWF      FARG_CANSPISetFilter_val+1
	MOVLW      0
	MOVWF      FARG_CANSPISetFilter_val+2
	MOVLW      0
	MOVWF      FARG_CANSPISetFilter_val+3
	MOVLW      247
	MOVWF      FARG_CANSPISetFilter_CANSPI_CONFIG_FLAGS+0
	CALL       _CANSPISetFilter+0
;Second_node.c,51 :: 		CANSPISetOperationMode(_CANSPI_MODE_NORMAL,0xFF);
	CLRF       FARG_CANSPISetOperationMode_mode+0
	MOVLW      255
	MOVWF      FARG_CANSPISetOperationMode_WAIT+0
	CALL       _CANSPISetOperationMode+0
;Second_node.c,53 :: 		while(1){
L_main0:
;Second_node.c,58 :: 		Msg_Rcvd = CANSPIRead(&Rx_ID, RxTx_Data, &Rx_Data_Len, &Can_Rcv_Flags);
	MOVLW      _Rx_ID+0
	MOVWF      FARG_CANSPIRead_id+0
	MOVLW      _RxTx_Data+0
	MOVWF      FARG_CANSPIRead_rd_data+0
	MOVLW      _Rx_Data_Len+0
	MOVWF      FARG_CANSPIRead_data_len+0
	MOVLW      _Can_Rcv_Flags+0
	MOVWF      FARG_CANSPIRead_CANSPI_RX_MSG_FLAGS+0
	CALL       _CANSPIRead+0
	MOVF       R0+0, 0
	MOVWF      _Msg_Rcvd+0
;Second_node.c,59 :: 		if ((Rx_ID == ID_1st) && Msg_Rcvd && Rx_Data_Len == 2) {
	MOVF       _Rx_ID+3, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _Rx_ID+2, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _Rx_ID+1, 0
	XORLW      47
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVF       _Rx_ID+0, 0
	XORLW      79
L__main8:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	MOVF       _Msg_Rcvd+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       _Rx_Data_Len+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main6:
;Second_node.c,60 :: 		received_value = ((unsigned int)RxTx_Data[0] << 8) | RxTx_Data[1];
	MOVF       _RxTx_Data+0, 0
	MOVWF      _received_value+0
	CLRF       _received_value+1
	MOVF       _received_value+0, 0
	MOVWF      _received_value+1
	CLRF       _received_value+0
	MOVF       _RxTx_Data+1, 0
	IORWF      _received_value+0, 1
	MOVLW      0
	IORWF      _received_value+1, 1
;Second_node.c,61 :: 		Lcd_Out(2,1,"RXD2:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Second_node+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Second_node.c,62 :: 		Lcd_Cmd(0xC6);
	MOVLW      198
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Second_node.c,63 :: 		Lcd_Chr_Cp(received_value/1000+'0');
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _received_value+0, 0
	MOVWF      R0+0
	MOVF       _received_value+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Second_node.c,64 :: 		Lcd_Chr_Cp(((received_value/100)%10)+'0');
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _received_value+0, 0
	MOVWF      R0+0
	MOVF       _received_value+1, 0
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
;Second_node.c,65 :: 		Lcd_Chr_Cp(((received_value/10)%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _received_value+0, 0
	MOVWF      R0+0
	MOVF       _received_value+1, 0
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
;Second_node.c,66 :: 		Lcd_Chr_Cp((received_value%10)+'0');
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _received_value+0, 0
	MOVWF      R0+0
	MOVF       _received_value+1, 0
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
;Second_node.c,67 :: 		Lcd_Out(2,11,"     ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Second_node+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Second_node.c,73 :: 		}
L_main4:
;Second_node.c,75 :: 		Delay_ms(200);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Second_node.c,76 :: 		}
	GOTO       L_main0
;Second_node.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
