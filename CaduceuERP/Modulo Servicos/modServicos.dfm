object frmServicos: TfrmServicos
  Left = 0
  Top = 0
  ActiveControl = edtConteudoPesquisa
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 424
  ClientWidth = 749
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object imgNovo: TImage
    Left = 688
    Top = 26
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Incluir'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      0000030B4944415478DAED9A5B884C711CC7FF33ECB28B904B3C99A20D110F48
      3642B491B288BC88A43CE0016DEBB2D95AEC32A97DE145B93CDA7D2097D42625
      B4D1A0DC696BAD7509BBB26EDBECCEEC8CCFCFCE684CE67ACEFF9C93CEBF3EFD
      6666FFFFFFF97ECE9C33E7FC67C7138D46951D6DEEDE26CF9DBA32C31BF7240B
      30711B65826E01AFD75BD37C7869B50E01AD6F4961C1C0DFB53714364522A500
      6FAF168179FBAFA94824F2E7B95109DB041AF795A975B54D86256C1390F95BBE
      28B5C16F4CC256016946256C17302AE1080123128E11C857C25102D2DABFABF8
      A75310097F2609CB05769C7EA0022D1D59F72787C75102D948140F2E54DDC15E
      E70A64D3C8F15F0804C951E40AB802AE802B609B40981C05AE802B90BABD814B
      700B1EC2279005F358724CA3969263B713059E40155C813E2313592D1086DA18
      3DB32E540DA3AE81E53003C681173EC06390E3A8E1DEAA435D4E10E881D57095
      E0725CEF843D3032C3385608AA1EEA1009DA25207B7E652CFC78EA79D9548E73
      3C8272245ED92170100E105E0E11396127E539CF7B988F44AB9502722CCF267C
      5F2CFC3FF73CA1FE7A4EFF54F33D8539F4EFB64AA01C2E12A8927A2455A71C04
      A4F9E95F6985C05BF01146EE67DA559A13364701D9FB3EC674E8163801DB09B3
      917A365DC71C05A4ED624CBD6E81F5D0409846EA5A9305AE3366896E8129F082
      302FA925A9C266DB92A43A99678C6E0139E6BBD8B05C8C869A2C206D906E81E1
      F08D0DFFA4166B1028D22D30115AD9B05C3D7D260B7C659E11BA05E2D780CBD4
      15E93AE671123733A654B7C031A820CC36EA719305AA1953A35B403E7D261366
      34F5B54A380F0C0A84A084316D56DC4A2C821B04F2532B4C123845FF2DF2C00A
      81DBB0804043A8F755C2F5204F81773093FE9D69054C6E5BD92127093595C737
      61549EF3FC80C5840FC45FB0EAA70672F3B510890012B258974F255F8E73C832
      53163477135FF4D8F1630F24E40A7D1436C3800CDDE55B8A73AAFFE6ED63F21F
      6D1148109195D9265806D321FE1D902C419FABFE45FD19823F4B3587AD024932
      F22B103937E43F329F091DCA66DC2FA192A88BA248E9A90000000049454E44AE
      426082}
    ShowHint = True
    Stretch = True
    OnClick = actIncluirExecute
  end
  object lblF2: TLabel
    Left = 706
    Top = 42
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Incluir'
    Caption = 'F2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = actIncluirExecute
  end
  object imgDesfazer: TImage
    Left = 688
    Top = 91
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Desfazer'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      000002AE4944415478DAED984B48945114C7BF49C647EA1046CB824270632B17
      6D7AD0DB8581D4A24D21888BC8959B9699ED8B36D1269184B68154F4D0AC1681
      8BDA47D083682566982945EAF4BB78671887B94FAFDF34700F1CFEE3CCB9E7FC
      7F33F7BBF38D997C3E9FD47264224004880011200244805A8E08E0136D034F3B
      917DE47652189825DFCDDFEDFEF95F0260F810D24FF6923B34A5CBE4283902CC
      F760001868473ED374D5D1F82072836CF0E09E20CF32736D530098C8210B34CA
      38183F823C219B3C8C97C769663FF702C0480BB2281EDB02B0661CB918C07869
      0C31FF961300469A915F85BF4D00D4D723EFC9BD81CD17A20F0FE3560098694C
      D62FA8A2691D00F575C852E2B7D75D62373EBE690130D320CD6F2B7D5E0520CD
      8B4FAAD1D18C383ABF24EBD7C97ECB351FF1D1AE04C04C56BE93D9F2959500A8
      CF48585BF373E4157A8D55E8751EB997983FC583AC7FA302F883D4575AA50058
      4EEC4F9A0BF4B86F2AA2E70C724053F2803EE75400CA23A91C805AB16D9A2D8C
      7F606D872564A1F7029253BCBC42BFE20EF1027030FF8A75475DCCCBFE9791DB
      365E9C01A811DF0B2D163E265973CAD5BC9C711879AD2969A2F76F67005E1737
      5BAD161EA6A83FE9635EFAE8411E9ADE4C2700E22BB9C762FE0B069CF0352F7D
      0C21374303D8C44B9A1FDB640FD3EDC85F66144FCA900041CC4B1F9F12F52DC9
      86532D1480D769A301D0F99860566F4880D0E6C597D88CA6649879D743013CA3
      59B783B93AD38F226A86916B9A920DBF0F425FC4A6C8317CD100F016E9D29464
      E9B19236C00F86B6D9141A3CCCD16757E9136900CC3374A7A579712D4D6B4AC6
      E8D59F2680B57939FF0E72495372867E8FD20270322FE78B7FA528B75AA55BFA
      AD02F0312FF6F6ACA6649A9EC7D300B0BE60CB00AE22239A921EFA3ED602D462
      44806A4704A87644806A4704A876D43CC03F439FAFB0F39E9AA5000000004945
      4E44AE426082}
    ShowHint = True
    Stretch = True
  end
  object imgSalvar: TImage
    Left = 688
    Top = 155
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Salvar'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      0000012C4944415478DA63FCFFFF3FC350068CA31E182C1E68D25BC30CA4FE0C
      B4830881BA4B218C23CB038CCC4C0C7E65960CFA9192F47121D03967173D61D8
      D67F82E1FF3F2A7820A8D686412754823E8E4702E7163F61D8D27D82720F0035
      D0DDF160F017E826C33543D80310378D7A00AB07F6ECD943558732323232383B
      3BD3CF03F402A31EC0E581D124442418F5002E0F8C262122C1A8077079603409
      1109463D80CB03A349884830EA81E1E181E3400F70D3DFF15756BF6058D77C84
      720FC81B8A33C4F5DA32308AD0CFF1D7D6BD6658DF7A98E1EF6FCC618991372E
      34D8C0C8F6003D4A246C25CFA807F079A0CD743DC39F9F7FA9E6D9510F8C7A60
      D403A31E18A21E4032E03F1ECD83DF03F83C31643C80CB1383BA2626D613030D
      48F2C060F404C91E18EC60D403030D0047F2F8B0964C0C8C0000000049454E44
      AE426082}
    ShowHint = True
    Stretch = True
    OnClick = actSalvarExecute
  end
  object imgExcluir: TImage
    Left = 688
    Top = 218
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Excluir'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      000002CA4944415478DAEDDACD6B13411806F0996CD22078F55229C583D2835E
      B4FF40C583AD7AED41F0AEB4A0D0AA21D84F0C096AC5806DBD79D2832814440C
      2278F320154450902269558C25BD143CB474D3F599B8BBA49BD9D935BB3BB3C2
      BEF032214C679F5FD21D7620D4300CA2A2CE975ED0C7B933812F4E9D002CBC8A
      A1376A00A574F6D1F5A1A92800917E25694D6B8E7AA3110AC215501E3D1D7AF8
      6C9A924BE50A69BD66508432406EB89F949E2C074628033CB8324856BED7C9DC
      B36008A5806DDD20DF6A1B8110CA01AC822062010882880DA0538432C0C3F1A1
      36809622E4EB8FBAB53B6D0171CB0B2115A0A528293F7D4B567E6EFAFE1B3C6E
      D0D80058EDEE36C8C2D23B21229B4993ED1D3D9E003B645A988B5CBCF732DE00
      AFBA7CBFC2862D00F62580049000128032800E402601845CBFD035F451B46B38
      13B00340575C006CDD4974E1C07ECDA8FF6E1CC26B96F2880BA08AE12C009FE3
      00606BE611BCD4FA26103D185E7310550006107ECD6B6119803DE1DF9FEB3F8C
      61F8C4F3E5820B827DF20398BF66CECF6358C27CEE3711358017FE0DFA20FA36
      425D7320328EF0450C39F43AFA240F11356002616E72C25BE544A438E1ADE222
      A204B0DDA69BDDB02EE1ADBA8350575BDFE08477454409F882F07D66A0311654
      30D74608C25B55C4DCBC0C005BE738101FCC60B318264408B4EE117E113D0280
      1D3AEA7BC0B9A3782144D5165E06202C0437BC2C4050846B7899804E11C2F0AA
      015EBB0DAB39841F174D50F52FE427BC2F848A9BF85FC27B22646FA39D84B7EA
      2E106332016C9D6308FFC967F805F406F97B66F08D90F528C1821745E1116CC4
      9C3BE38198C1DC6919801A00DD6628D1C39C1DDE2A01A28E3E85F91F650058DD
      00A22040CC23CC683359FBE3B413D1165E0808A99A071A1C0D79071A3B3CAEC9
      C2BF4267D1F651B205C10DEF065825E1FED48087B88030938EF07DE6FCAA03C1
      0E3C155E782EE07FAB04A0BAFE003693EDBF0931CC0B0000000049454E44AE42
      6082}
    ShowHint = True
    Stretch = True
    OnClick = lblF5Click
  end
  object imgEditar: TImage
    Left = 690
    Top = 283
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Editar'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000300000
      003008060000005702F987000000097048597300000EC400000EC401952B0E1B
      000002494944415478DAED9A3F4BC34018872F2D050571A89393AB4E4E1D9C9C
      DC32285DDCFD0EB56DDA0A222914847E0257674B707013ECE6E6A053A9834A87
      2A224AFFD7DFD504626C9A9ACBE5AED0175EDEBB5EC8FB3CE9119A5065381C92
      590EC52990C964EA286BDC1B2BCAB1AEEB473C04B87E25D1687454FBFD7E2012
      AE02C562918B40369B25F69EAC12C2045455258661304B0813A0E7AF56ABCC12
      420568B04A0817609590428045421A01BF12520938245A90287949842E502E97
      49A3D198FA7870285209D46A3552A954264AC46231D2ED76E514F00ACAD3EBF5
      48A150984D011A54209FCFD3610B1C8B7381B9C05C602E106ED0A7B55C2E4787
      6D702CD8D7B633C688EFBAA82AD20A0C0603A2695A07C33D705C3AE1ADA012B2
      0A742090048361824701DB47FDC2D4BEA59A320A7420908C442216FC2ACAB3B5
      65307F4759368F6DCB2640B74D12F90BDE5AB4497CA02CC9B68526C28F918863
      FC2A8BC054F04E091A3208F886974180095EB40033BC488140E0450904062F42
      2050F8B00502870F53800B7C5802BEE1C192024749A4000B7C1A450747449400
      CBB6498343A77CA2DE0B0D9029E4A91F78A40E0EC5E410227082CC5B13E79394
      173CE502071125F0885C47B6BC04DCE04D0E610207C8330BDCF6FBFDCFF3AC1B
      BC48817BE426B20BE01DD42B3BACF38D821B7C20023E63170D2F265D717CBE82
      71D3EC3516DE1E7E04EAC4DF5F0D6ED12C6142EEA39C3BD6DF001EB7F5F18447
      3CE09C1BFF1208221C57FF099900FC4BE08D7808005E233FB7D14FE416C0EF78
      80F314A8A21C02FC8627B815DFC14BE57B15EBD57A0000000049454E44AE4260
      82}
    ShowHint = True
    Stretch = True
    OnClick = actEditarExecute
  end
  object imgSair: TImage
    Left = 688
    Top = 373
    Width = 51
    Height = 44
    Cursor = crHandPoint
    Hint = 'Sair'
    ParentShowHint = False
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000001000000
      010008060000005C72A866000000097048597300000EC400000EC401952B0E1B
      00000CC74944415478DAEDDD6FAC967519C0F19B26476D2D50C7A28910C49274
      6CB5B3603288CDD2C9A25ED88B5E553AAB6593244D47315B2FC24D0D26E34C7B
      118BD5D6ABE68BA693D17263A04D8DCDE522702642B1180ED96918FF04BA2ECE
      73297FCE9FE779CE7DDFD7EFF7BBBE9FEDB77BB029176CD7F73CE7B99FE73953
      CE9D3B570188690A0100E2220040600400088C00008111002030020004460080
      C008001018010002230040600400088C00008111002030020004460080C00800
      1018010002230040600400088C00008111002030020004460080C00800101801
      0002230040600400088C00008111002030020004460080C08A0DC0AE9583B3E5
      B254CEE7E4CC97A3BFBE56CE5CEFD990B47D72DE957340CE9B725E93B373F0D9
      5D07BC076B42510190A5BF452EDF90F3B58A4547BD340C7F94F37B89C12BDEC3
      D425FB00C8D25F2D977BE4DC5F8D7CA5079AA68F0C36CAD92C3138EE3DCC6464
      1B0059FC01B9DC2B67AD9C19DEF320A477E4AC93F3B484E094F730FDC83200B2
      FCCBE5F2949C9BBC6701C46E393F90086CF71EA4575905A0F355FFF16AE4E13E
      909A21390FE6F468209B00749ED57F46CEA0F72CC03876C9B93397BB06590440
      967FA15CB6C999E93D0BD08543726E9708BCEE3DC844920F802CBFDECB7F56CE
      34EF59801E0CCB592911D8E93DC878920E40E72BFF8E8AE5479E3402CB527E24
      906C003ADFF3BF24E77AEF59804938286749AACF09241980CEB3FDFA957F91F7
      2C400DF49583CB52BC3B906A00D6CBE501EF39801A6D9400ACF61EE252C905A0
      F3A4DF0EEF3980062C4BED49C1A402D079E8FF57390BBD67011AA0AF18FC7C4A
      DF0AA416007DD8BFDE7B0EA041FA4AC10DDE43986402D07957DF5B152FF641D9
      F44542F3527917614A01D077F63DE53D07D08255128021EF21544A01D823971B
      BDE7005AB05702B0C07B0895440064F9F57EFFCBDE73002D5A9CC2270BA51280
      4D72B9CF7B0EA04543128055DE43A412007DF28FCFF04324FB2400F3BC87700F
      40E735FFFBBDFF21000773BCDF23904200EE92CB6F5C87007CDC2D01D8E23940
      0A0178B2E223BE1093FBFB035208C0F372B9C37508C0C75609C00ACF01520800
      F7FF11D56E09C0CD9E03A41080C3159FEB8F980E4A0066790E9042004ECA65C0
      7508C0C7B00460BAE7002904C0FF8508801309C014CF3F9F00008E0800014060
      04800020300240001018012000088C0010000446000800022300040081110002
      80C0080001406004800020300240001018012000088C00100004460008000223
      000400811180A00198F685A5D5897FEFAF4EFEE75FDEA3B89A7ACD75D547E77F
      B61A7E75A7F7282E0840C000E8F27F7AED2FABF7878F567BD77C2F6C0474F93F
      F3E8AFAA2B3F7943B5EF89B5D5D117FFEC3D52EB0840B000D8F24FB962EAF95F
      9F3E723864046CF9AFBA61E4A7639D7BFF74C80810804001B874F94DB4085CBA
      FC266204084090008CB5FC264A04C65A7E73EEECD96ADF636BC24480000408C0
      44CB6F4A8FC044CB6F22458000141E806E97DF941A816E97DF44890001283800
      1F1F5C52CD7F6443D7CB6F4A8B40AFCB6F22448000141A807E97DF9412817E97
      DF941E010250600026BBFC26F7084C76F94DC91120008505A0AEE537B946A0AE
      E537E723A0B708776CF3FEABD58A00141480BA97DFE41681BA97DF9418010250
      48009A5A7E934B049A5A7E535A0408400101D0E5D75B7D1F19B8B2D13F27F508
      34BDFCA6A4081080CC03D0D6F29B5423D0D6F29B52224000320E40DBCB6F528B
      40DBCB6F34026FAF7FA47A77FB56EF7F82BE11804C03E0B5FC269508782DBFC9
      3D020420D3005CF7A5AF569FFAD1CF5D67F08E80F7F29B835B365587FEB0C575
      867E11804C03A0224780E5AF0701C838002A620458FEFA1080CC03A0224580E5
      AF17012820002A420458FEFA11804202A04A8E00CBDF0C0250500054891160F9
      9B43000A0B802A29022C7FB30840810150254480E56F1E012834002A9508BCF1
      D3EF57270EEEEFE9BF63F9DB41000A0E80CA31022C7F7B0840E10150394580E5
      6F170108100095430458FEF61180200150294780E5F74100020540A5180196DF
      0F01081600955204CEFCEF18CBEF8800040C804A2502674E1CAFAEBA7E8EEB1C
      51975F1180A001502944C05BE4E5570420700054E408445F7E4500820740458C
      00CB3F82001080F3224580E5FF100120001F88100196FF620480005CA4E408B0
      FC97230004E032254680E51F1D012000A32A29022CFFD80800011853091160F9
      C7470008C0B8728E00CB3F310240002694630458FEEE100002D0959C22C0F277
      8F001080AEE5100196BF37048000F424E508B0FCBD230004A067294680E5EF0F
      0120007D4929022C7FFF080001E88B7E8CD7820DBFAD0666CC749DE3CC7BC7AA
      3D0F7CABE79F3B8011048000F42C95CFF033FDFEF011100002D0A3D496DF1081
      FE100002D0B55497DF1081DE110002D095D497DF1081DE10000230A15C96DF10
      81EE11000230AEDC96DF1081EE10000230A65C97DF10818911000230AADC97DF
      9C3E7AA47A63CD7789C018080001B84C29CB6F88C0D8080001B84869CB6F88C0
      E8080001F840A9CB6F88C0E508000138AFF4E53744E06204800084597E43043E
      4400820720DAF21B22308200040E40D4E537448000840D40F4E537D123400002
      062095E5D74FF2D105F4FE64A1C8112000C10290D2F2DBC778A5F0F162512340
      00020520C5E53744C007010812809497DF1081F611800001C861F90D11681701
      283C00392DBF2102ED2100050720C7E53744A01D04A0D000E4BCFC8608348F00
      1418801296DF1081661180C20250D2F21B22D01C025050004A5C7E43049A4100
      0A0940C9CB6F8840FD0840010188B0FC8608D48B00641E8048CB6F88407D0840
      C60188B8FC8608D48300641A80C8CB6F88C0E411804C0330EBEE1F569FF8FAB7
      5D67F05C7E9342048EBCF05CF5F6869FB9CED02F02906900A65C31B59AFBE35F
      54D72CFDB2CB9F9FC2F21BCF08FC77D78BD53FD73D549D3D75D2FB9FA12F0420
      D30028AF08A4B4FCC62302B92FBF2200190740B51D811497DFB4198112965F11
      80CC03A0DA8A40CACB6FDA884029CBAF08400101501A81790F3F5A4D5F726B23
      FFFF1C96DF34198192965F11804202A09A8A404ECB6F9A884069CBAF08404101
      50754720C7E5377546A0C4E55704A0B000A8BA2290F3F29B3A2250EAF22B0250
      6000D4642350C2F29BC944A0E4E55704A0D000A87E2350D2F29B7E2250FAF22B
      0250700054AF112871F94D2F1188B0FC8A00141E00D56D044A5E7ED34D04A22C
      BF22000102A0268A4084E537E34520D2F22B02102400EA7C047EF258357DF1F2
      8B7E3FD2F29BD122106DF91501081400756904222EBFB9300211975F11806001
      501681F7FEF1B7B0CB6F3402D77EF1B690CBAF0840C000008600100004460008
      0002230004008111000280C0080001406004800020300240001018012000088C
      001000044600080002230004008111000280C008000140600480002030024000
      1018012000088C00AC1CD48F8119701D02F0312C0198EE39400A01382C9719AE
      43003E0E4A0066790E904200F6C8E546D721001F7B25000B3C07482100CFCBE5
      0ED721001F5B25002B3C074821004FCAE57ED721001F1B2500AB3D07482100F7
      C8E5D7AE43003EBE2301D8EC39400A01982D97FDAE43003EE648000E780EE01E
      002511784B2E73BDE7005A7440967F8EF710A90460935CEEF39E0368D1900460
      95F710A90460915C5EF69E0368D16209C02BDE43241100C5EB011088FBFD7F93
      5200F45B804DDE73002D582D01D8E83D844A290057CB459F0C9CE93D0BD0A043
      72E649008E7B0FA292098092083C2497C7BDE7001AF4B02CFF13DE4398D402A0
      EF0AFCBB9CF9DEB3000D7853CECD128053DE8398A402A02402B7C9659BF71C40
      036E97E5FF93F710174A2E008AD705A04049DCF7BF54AA01D06F0576C859E43D
      0B50835D7296A4F4D0DF2419002511D09706BF5471570079D367FD75F9F7790F
      329A6403A024020BAB914702D3BC6701FA302C67992CFFEBDE838C25E9002889
      C052B9E887867CCC7B16A007C7E4AC90E5DFE93DC878920F80EA3C12D03B037C
      3B801CE8C37E5DFED7BC0799481601509DCF0D7846CEA0F72CC038F409BF3BBD
      DFE7DFAD6C02A03A7707F495827C8418523424E7C1149FED1F4B56013012825B
      AB91370EDDE43D0B2076CB59258BFF82F720BDCA3200AAF368E05E396B2B7EAE
      007CBC23679D9CA773FAAA7FA16C03603AEF22D40F16D56F0B780F01DAA0AFE9
      D7B7F36E4EE55D7DFDCA3E00179218DC22976FCAF98A9CD9DEF3A028FAA4DE73
      727E274BFF17EF61EA5254002ED4B96BB0BC1AB96BA08F0CF416A2FE1EDF2E60
      3CFAB05E975D6FE5E9577A7D567F7B2ECFEAF7AAD80000981801000223004060
      0400088C00008111002030020004460080C00800101801000223004060040008
      8C00008111002030020004460080C008001018010002230040600400088C0000
      8111002030020004460080C008001018010002230040600400088C0000811100
      2030020004460080C0FE0F8B6E66A67119EE770000000049454E44AE426082}
    ShowHint = True
    Stretch = True
    OnClick = WindowClose1Execute
  end
  object lblF3: TLabel
    Left = 707
    Top = 100
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Desfazer'
    Caption = 'F3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = False
  end
  object lblF4: TLabel
    Left = 706
    Top = 162
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Salvar'
    Caption = 'F4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = actSalvarExecute
  end
  object lblF5: TLabel
    Left = 707
    Top = 229
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Excluir'
    Caption = 'F5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = lblF5Click
  end
  object lblF6: TLabel
    Left = 706
    Top = 296
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Editar'
    Caption = 'F6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = actEditarExecute
  end
  object grpPesquisa: TGroupBox
    Left = 8
    Top = 8
    Width = 667
    Height = 70
    Caption = 'Pesquisa'
    TabOrder = 0
    object rdpOpcoesPesquisa: TRadioGroup
      Left = 8
      Top = 18
      Width = 289
      Height = 48
      Cursor = crHandPoint
      Caption = 'Op'#231#245'es'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 0
      OnClick = rdpOpcoesPesquisaClick
    end
    object grpConteudoPesquisa: TGroupBox
      Left = 299
      Top = 19
      Width = 364
      Height = 48
      Caption = 'Conte'#250'do'
      TabOrder = 1
      object impPesquisar: TImage
        Left = 331
        Top = 19
        Width = 27
        Height = 22
        Cursor = crHandPoint
        Hint = 'pesquisar'
        ParentShowHint = False
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
          002808060000008CFEB86D000000097048597300000EC400000EC401952B0E1B
          000004F34944415478DAE5D87F4C94751C07F0CFF739100B995C0988B24012BC
          1C4D5C6A9DFD746612BAD658F9E38F52764C9BCD5A9BD619E6DC1A9BB3326D85
          66A8A12E755009CB8B0409A4719B2D70A3302B31A94D0D8C8414D0EE9EDEDFE7
          B9E77C787C9EBBE77E046E7DB7CF3E77CFDD3DDF179FEFF3FD3EDF07268A22DD
          CA8DFDAF8056874B40CA444C418C43C4202E23CE22DA7B76E5F78F0810303B52
          21620122D5E06B1CD788D88FF814D8C1FF1C08D874A477108FF27385F0D34E44
          31E213400302C202FA86D289D848F230DE38213386A22B6D675F200A81BC1435
          E01D4535B1A2E8FD082F9FD783DD3D612CD9B393E9AEA431641118FD71B99F5A
          3B2E51CB996EFAC7E3D5839E423C096467C4406B910B0E613780CBD4308B2090
          63DE14723E3B89127DC52279C887E472770F95549CA4EEDE7E2DF467C4434076
          450A7C19C07701F4E36C1313A9EA8DD99414E3C7180295CF5EDCF7133BD0F88B
          1659EBABA4372C207093914E02180FA0C871765B0A1D59735F58B36C73CD79B6
          A9B2558B7C01C09DE1020F212D02903830737C02FBAEE461BD6A05ADA072EC95
          036758F9B1D36AE0454416907F8704046E12C9D7898503F9D9DD6FE589D9D670
          6A37B4E53A9B5867779F1AB90AC01DA102D723BD29FD00C00533D368DFCA1CE5
          E3B02BC8F391F6017A6E4BBD1AE806F0C15081CD487605585F9227E6A6186242
          02F203E9ABEBA8AFFF9A82F420C62B6B63502070A391F8F41FC3DFC7C78D127F
          FFE0F1C8C756D58A769D629FB9CFAAABF8048075668119481DCA5F3B637232D5
          3A6704AC48A815FCF07837ADDB7B4277369B01F2FB6D8BF27EE1CC0C5C7F53A3
          BA47AB6ABB4A85DB1A980AE80470B359602E52ABF2FEA9591954BE626A542BF8
          79DB15D1B1AD510D7C15C0B7CD02D349DECF49279B9E394EAC7F7D56340B48A5
          0D5D6CFDFE6FD543EC00708F59601CC9932481BF1F1D13EB3DBF631E8B660597
          EF6CA7EA13BFAA818F00F88D29A00F791C49BA6DF065E6CB8DF3C5FBD358D480
          69AB6AE9CAE0750532804856EE266681AF216D528073A7A57A2B564F0B65836A
          D82A5AFA68656993FAFA3B0A5C9EF2B959601AC94B4D2C071279B158E71316EB
          882B78CF9A06BAF8D755F5F02E05F05048401FF263A465CA662179EC6D9ED35B
          E65822A9DE8ADD3FB2CAE60EEDBE3007C0EBE100E722D529407E2C27DDEA69DA
          60B78453C1E2CA73B4BDE607EDEEFA69E0AAD5FD9A1D621BD231C4043590B754
          EBED9EC3C58FC56067631AB8B4B48D7DD5F29B16B7073887B66F33CB0CC7F1FB
          E244E9071AA0740C5D3F333B93D616D8282B51FF3C7C6A6EAFBDC0B6567FAFDE
          18288D2F29F3F59E9B0302F180340417AC31CC1F6B7C9CE781EC244B7A4A0236
          8F7868EA1DA0563C30755CE8238F57B72F3E32057F96E5F5EA9ED30818082792
          97A2D0F8B6EA3DC4BA9E32E387785D60B0CAF980D7102F21F8DEAB00219884F1
          0EDD88B5803507FBF24D403C94DB1813A40961DC83975F524BD04195F49B2257
          36D27292FFF5C1FFB8513AD5E2CFBD47117BCDC07481D28410B1943021D03537
          08E06205A76D38079F267C8371A7AFAAFC9F47E7105DF84DC8DB343FD03F5B45
          2C254C30BA8DF16B65312EE82AB31D44DA2420705978FD35F16B0ED3DF00280D
          EB70E2D4C083BC32D2117D209F108B861B7703E8706D257946EA353EAC4BB088
          0E3B4E0D8CC76B7E0F9C231FF5DF96645C59FEE191C0F981BC0D41CA40694218
          CDD66107AA90EF83772FF206E05C2389BB09782BB67F01FB7FBFCFED5D938500
          00000049454E44AE426082}
        ShowHint = True
        Stretch = True
      end
      object edtConteudoPesquisa: TEdit
        Left = 7
        Top = 19
        Width = 318
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        TextHint = 'Digite aqui para pesquisar, e pressione <ENTER>'
        OnEnter = edtConteudoPesquisaEnter
        OnExit = edtConteudoPesquisaExit
        OnKeyDown = edtConteudoPesquisaKeyDown
        OnKeyPress = edtConteudoPesquisaKeyPress
      end
    end
  end
  object pgcServicos: TPageControl
    Left = 8
    Top = 81
    Width = 667
    Height = 296
    ActivePage = tdsCadastro
    TabOrder = 1
    object tbsTabela: TTabSheet
      Caption = 'Tabela'
      object grdTabela: TDBGrid
        Left = 0
        Top = 0
        Width = 659
        Height = 268
        Cursor = crHandPoint
        Align = alClient
        DataSource = dmMSource.dtsServicos
        DrawingStyle = gdsClassic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = grdTabelaDrawColumnCell
        OnDblClick = grdTabelaDblClick
        OnKeyPress = grdTabelaKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'SERVICO'
            Title.Alignment = taCenter
            Title.Caption = 'C'#211'DIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_1'
            Title.Alignment = taCenter
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 423
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
    object tdsCadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object grpCadastro: TGroupBox
        Left = 3
        Top = 3
        Width = 653
        Height = 263
        Enabled = False
        TabOrder = 0
        object lblCodigo: TLabel
          Left = 8
          Top = 20
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object lblDescricao: TLabel
          Left = 8
          Top = 44
          Width = 46
          Height = 13
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCST_ISS: TLabel
          Left = 8
          Top = 90
          Width = 38
          Height = 13
          Caption = 'CST ISS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblValor: TLabel
          Left = 8
          Top = 113
          Width = 24
          Height = 13
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object grpPisCofins: TGroupBox
          Left = 2
          Top = 146
          Width = 642
          Height = 114
          Caption = 'Pis / Cofins'
          TabOrder = 5
          object grpPis: TGroupBox
            Left = 5
            Top = 16
            Width = 316
            Height = 93
            Caption = 'Informa'#231#245'es PIS'
            TabOrder = 0
            object lblAliqPIS: TLabel
              Left = 16
              Top = 21
              Width = 53
              Height = 13
              Caption = 'Aliquota %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCST_PIS_Entrada: TLabel
              Left = 16
              Top = 45
              Width = 60
              Height = 13
              Caption = 'CST Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCST_PIS_Saida: TLabel
              Left = 16
              Top = 70
              Width = 48
              Height = 13
              Caption = 'CST Sa'#237'da'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtAliquotaPIS: TDBEdit
              Left = 88
              Top = 18
              Width = 121
              Height = 21
              DataField = 'ALIQUOTA_PIS'
              DataSource = dmMSource.dtsServicos
              TabOrder = 0
              OnEnter = edtDescricao_1Enter
              OnExit = edtDescricao_1Enter
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtValorKeyPress
            end
            object edtCST_PIS_Entrada: TDBEdit
              Left = 88
              Top = 42
              Width = 50
              Height = 21
              DataField = 'CST_PIS_ENTRADA'
              DataSource = dmMSource.dtsServicos
              TabOrder = 1
              OnEnter = edtDescricao_1Enter
              OnExit = edtCST_PIS_EntradaExit
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtConteudoPesquisaKeyPress
            end
            object edtCST_PIS_Saida: TDBEdit
              Left = 88
              Top = 67
              Width = 50
              Height = 21
              DataField = 'CST_PIS'
              DataSource = dmMSource.dtsServicos
              TabOrder = 2
              OnEnter = edtDescricao_1Enter
              OnExit = edtCST_PIS_SaidaExit
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtConteudoPesquisaKeyPress
            end
          end
          object grpCOFINS: TGroupBox
            Left = 322
            Top = 17
            Width = 316
            Height = 93
            Caption = 'Informa'#231#245'es COFINS'
            TabOrder = 1
            object lblAliqCOFINS: TLabel
              Left = 16
              Top = 20
              Width = 53
              Height = 13
              Caption = 'Al'#237'quota %'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCST_COFINS_Entrada: TLabel
              Left = 16
              Top = 44
              Width = 60
              Height = 13
              Caption = 'CST Entrada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblCST_COFINS_Saida: TLabel
              Left = 16
              Top = 69
              Width = 48
              Height = 13
              Caption = 'CST Saida'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edtAliquotaCOFINS: TDBEdit
              Left = 104
              Top = 17
              Width = 121
              Height = 21
              DataField = 'ALIQUOTA_COFINS'
              DataSource = dmMSource.dtsServicos
              TabOrder = 0
              OnEnter = edtDescricao_1Enter
              OnExit = edtDescricao_1Enter
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtValorKeyPress
            end
            object edtCST_COFINS_Entrada: TDBEdit
              Left = 104
              Top = 41
              Width = 50
              Height = 21
              DataField = 'CST_COFINS_ENTRADA'
              DataSource = dmMSource.dtsServicos
              TabOrder = 1
              OnEnter = edtDescricao_1Enter
              OnExit = edtCST_COFINS_EntradaExit
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtConteudoPesquisaKeyPress
            end
            object edtCST_COFINS_Saida: TDBEdit
              Left = 104
              Top = 66
              Width = 50
              Height = 21
              DataField = 'CST_COFINS'
              DataSource = dmMSource.dtsServicos
              TabOrder = 2
              OnEnter = edtDescricao_1Enter
              OnExit = edtCST_COFINS_SaidaExit
              OnKeyDown = edtConteudoPesquisaKeyDown
              OnKeyPress = edtConteudoPesquisaKeyPress
            end
          end
        end
        object edtCodigo: TDBEdit
          Left = 72
          Top = 14
          Width = 89
          Height = 21
          Color = 14079702
          DataField = 'SERVICO'
          DataSource = dmMSource.dtsServicos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnKeyDown = edtConteudoPesquisaKeyDown
          OnKeyPress = edtConteudoPesquisaKeyPress
        end
        object edtDescricao_1: TDBEdit
          Left = 72
          Top = 41
          Width = 550
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = True
          DataField = 'DESCRICAO_1'
          DataSource = dmMSource.dtsServicos
          ParentCtl3D = False
          TabOrder = 1
          OnEnter = edtDescricao_1Enter
          OnExit = edtDescricao_1Exit
          OnKeyDown = edtConteudoPesquisaKeyDown
          OnKeyPress = edtConteudoPesquisaKeyPress
        end
        object edtDescricao_2: TDBEdit
          Left = 72
          Top = 64
          Width = 550
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO_2'
          DataSource = dmMSource.dtsServicos
          TabOrder = 2
          OnEnter = edtDescricao_1Enter
          OnExit = edtDescricao_2Exit
          OnKeyDown = edtConteudoPesquisaKeyDown
          OnKeyPress = edtConteudoPesquisaKeyPress
        end
        object edtCST_ISS: TDBEdit
          Left = 72
          Top = 87
          Width = 49
          Height = 21
          DataField = 'CST'
          DataSource = dmMSource.dtsServicos
          TabOrder = 3
          OnEnter = edtDescricao_1Enter
          OnExit = edtCST_ISSExit
          OnKeyDown = edtConteudoPesquisaKeyDown
          OnKeyPress = edtConteudoPesquisaKeyPress
        end
        object edtValor: TDBEdit
          Left = 72
          Top = 110
          Width = 121
          Height = 21
          DataField = 'VALOR'
          DataSource = dmMSource.dtsServicos
          TabOrder = 4
          OnEnter = edtDescricao_1Enter
          OnExit = edtDescricao_1Enter
          OnKeyDown = edtConteudoPesquisaKeyDown
          OnKeyPress = edtValorKeyPress
        end
      end
    end
  end
  object grpMensagem: TGroupBox
    Left = 4
    Top = 377
    Width = 671
    Height = 33
    Caption = 'Mensagem'
    TabOrder = 2
    object lblMsg: TLabel
      Left = 66
      Top = 14
      Width = 600
      Height = 16
      ParentCustomHint = False
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Left = 412
    Top = 190
    object actEditar: TAction
      Category = 'Window'
      Caption = 'actEditar'
      ShortCut = 117
      OnExecute = actEditarExecute
    end
    object actDesfazer: TAction
      Category = 'Window'
      Caption = 'actDesfazer'
      ShortCut = 114
      OnExecute = actDesfazerExecute
    end
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
      OnExecute = WindowClose1Execute
    end
    object actMinimizar: TAction
      Category = 'Window'
      Caption = 'actMinimizar'
    end
    object actIncluir: TAction
      Category = 'Window'
      Caption = 'actIncluir'
      ShortCut = 113
      OnExecute = actIncluirExecute
    end
    object actSalvar: TAction
      Category = 'Window'
      Caption = 'actSalvar'
      ShortCut = 115
      OnExecute = actSalvarExecute
    end
    object actExcluir: TAction
      Category = 'Window'
      Caption = 'actExcluir'
      OnExecute = actExcluirExecute
    end
  end
end
