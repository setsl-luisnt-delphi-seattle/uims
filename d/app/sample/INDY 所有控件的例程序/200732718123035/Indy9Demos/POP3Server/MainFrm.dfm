�
 TFRMMAIN 0�  TPF0TfrmMainfrmMainLeft� TopkBorderStylebsDialogCaptionIndy POP3 Server DemoClientHeight� ClientWidth_Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder
OnActivateFormActivatePixelsPerInch`
TextHeight TButtonbtnExitLeft� Top� WidthKHeightCaptionExitTabOrder OnClickbtnExitClick  TMemo
moCommentsLeftTopWidthQHeight� Color	clBtnFaceLines.StringsIndy POP3 Server Demo )The Indy POP3 Server Demo is now running. 7Click Start and type TELNET LOCALHOST 110 and click OK.* OR *>Configure an e-mail client to connect to localhost, using any username or password you wish. <This server always serves one standard response e-mail, and )correctly reponds to all common commands. ReadOnly	
ScrollBars
ssVerticalTabOrder  TIdPOP3ServerIdPOP3Server1Bindings CommandHandlers Greeting.NumericCode Greeting.Text.Strings+OK Welcome to Indy POP3 Server MaxConnectionReply.NumericCode 	OnConnectIdPOP3Server1ConnectOnExceptionIdPOP3Server1ExceptionReplyExceptionCode 
ReplyTexts ReplyUnknownCommand.NumericCode  ReplyUnknownCommand.Text.Strings-ERR Sorry, Unknown Command 	CheckUserIdPOP3Server1CheckUserOnLISTIdPOP3Server1LISTOnRETRIdPOP3Server1RETROnDELEIdPOP3Server1DELEOnUIDLIdPOP3Server1UIDLOnSTATIdPOP3Server1STATOnTOPIdPOP3Server1TOPOnRSETIdPOP3Server1RSETOnQUITIdPOP3Server1QUITLeft� Top�    