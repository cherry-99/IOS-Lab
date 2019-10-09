
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 50 2e 10 80       	mov    $0x80102e50,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 40 6f 10 80       	push   $0x80106f40
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 b5 41 00 00       	call   80104210 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 47 6f 10 80       	push   $0x80106f47
80100097:	50                   	push   %eax
80100098:	e8 43 40 00 00       	call   801040e0 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 87 42 00 00       	call   80104370 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 b9 42 00 00       	call   80104420 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ae 3f 00 00       	call   80104120 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 5d 1f 00 00       	call   801020e0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 4e 6f 10 80       	push   $0x80106f4e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 0d 40 00 00       	call   801041c0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 17 1f 00 00       	jmp    801020e0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 5f 6f 10 80       	push   $0x80106f5f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 cc 3f 00 00       	call   801041c0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 7c 3f 00 00       	call   80104180 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 60 41 00 00       	call   80104370 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 bf 41 00 00       	jmp    80104420 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 66 6f 10 80       	push   $0x80106f66
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 bb 14 00 00       	call   80101740 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 df 40 00 00       	call   80104370 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002a6:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 a0 ff 10 80       	push   $0x8010ffa0
801002bd:	e8 6e 3a 00 00       	call   80103d30 <sleep>
801002c2:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	e8 99 34 00 00       	call   80103770 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 35 41 00 00       	call   80104420 <release>
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 6d 13 00 00       	call   80101660 <ilock>
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 ff 10 80 	movsbl -0x7fef00e0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 d5 40 00 00       	call   80104420 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 0d 13 00 00       	call   80101660 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
80100378:	fa                   	cli    
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100389:	e8 52 23 00 00       	call   801026e0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 6d 6f 10 80       	push   $0x80106f6d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
801003a5:	c7 04 24 db 78 10 80 	movl   $0x801078db,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 73 3e 00 00       	call   80104230 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 81 6f 10 80       	push   $0x80106f81
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 d1 56 00 00       	call   80105af0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 18 56 00 00       	call   80105af0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 0c 56 00 00       	call   80105af0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 00 56 00 00       	call   80105af0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 07 40 00 00       	call   80104520 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 42 3f 00 00       	call   80104470 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 85 6f 10 80       	push   $0x80106f85
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 b0 6f 10 80 	movzbl -0x7fef9050(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 2c 11 00 00       	call   80101740 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 50 3d 00 00       	call   80104370 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 d4 3d 00 00       	call   80104420 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 0b 10 00 00       	call   80101660 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 0e 3d 00 00       	call   80104420 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 98 6f 10 80       	mov    $0x80106f98,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 a3 3b 00 00       	call   80104370 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 9f 6f 10 80       	push   $0x80106f9f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 68 3b 00 00       	call   80104370 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100836:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 b3 3b 00 00       	call   80104420 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
801008f1:	68 a0 ff 10 80       	push   $0x8010ffa0
801008f6:	e8 e5 35 00 00       	call   80103ee0 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010090d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100934:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 54 36 00 00       	jmp    80103fd0 <procdump>
8010097c:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 a8 6f 10 80       	push   $0x80106fa8
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 5b 38 00 00       	call   80104210 <initlock>
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
801009bb:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009c2:	06 10 80 
801009c5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009cc:	02 10 80 
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 
801009d9:	e8 b2 18 00 00       	call   80102290 <ioapicenable>
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 6f 2d 00 00       	call   80103770 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a07:	e8 34 21 00 00       	call   80102b40 <begin_op>
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 99 14 00 00       	call   80101eb0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 33 0c 00 00       	call   80101660 <ilock>
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 02 0f 00 00       	call   80101940 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 a1 0e 00 00       	call   801018f0 <iunlockput>
80100a4f:	e8 5c 21 00 00       	call   80102bb0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
80100a74:	e8 07 62 00 00       	call   80106c80 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 73 0e 00 00       	call   80101940 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 c7 5f 00 00       	call   80106ad0 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 d1 5e 00 00       	call   80106a10 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 a2 60 00 00       	call   80106c00 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 81 0d 00 00       	call   801018f0 <iunlockput>
80100b6f:	e8 3c 20 00 00       	call   80102bb0 <end_op>
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b7a:	83 c4 0c             	add    $0xc,%esp
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 36 5f 00 00       	call   80106ad0 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 4f 60 00 00       	call   80106c00 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bbe:	e8 ed 1f 00 00       	call   80102bb0 <end_op>
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 c1 6f 10 80       	push   $0x80106fc1
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 2a 61 00 00       	call   80106d20 <clearpteu>
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 7e 3a 00 00       	call   801046b0 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 6b 3a 00 00       	call   801046b0 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 3a 62 00 00       	call   80106e90 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c6b:	83 c7 01             	add    $0x1,%edi
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100ca5:	29 c1                	sub    %eax,%ecx
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cbb:	e8 d0 61 00 00       	call   80106e90 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
80100cde:	0f b6 10             	movzbl (%eax),%edx
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 6b 39 00 00       	call   80104670 <safestrcpy>
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
80100d10:	89 30                	mov    %esi,(%eax)
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
80100d29:	89 0c 24             	mov    %ecx,(%esp)
80100d2c:	e8 4f 5b 00 00       	call   80106880 <switchuvm>
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 c7 5e 00 00       	call   80106c00 <freevm>
80100d39:	83 c4 10             	add    $0x10,%esp
80100d3c:	31 c0                	xor    %eax,%eax
80100d3e:	e9 19 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d43:	66 90                	xchg   %ax,%ax
80100d45:	66 90                	xchg   %ax,%ax
80100d47:	66 90                	xchg   %ax,%ax
80100d49:	66 90                	xchg   %ax,%ax
80100d4b:	66 90                	xchg   %ax,%ax
80100d4d:	66 90                	xchg   %ax,%ax
80100d4f:	90                   	nop

80100d50 <fileinit>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
80100d56:	68 cd 6f 10 80       	push   $0x80106fcd
80100d5b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d60:	e8 ab 34 00 00       	call   80104210 <initlock>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
80100d74:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d79:	83 ec 10             	sub    $0x10,%esp
80100d7c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d81:	e8 ea 35 00 00       	call   80104370 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
80100da2:	83 ec 0c             	sub    $0xc,%esp
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dac:	68 c0 ff 10 80       	push   $0x8010ffc0
80100db1:	e8 6a 36 00 00       	call   80104420 <release>
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc8:	e8 53 36 00 00       	call   80104420 <release>
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dea:	68 c0 ff 10 80       	push   $0x8010ffc0
80100def:	e8 7c 35 00 00       	call   80104370 <acquire>
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
80100dfe:	83 c0 01             	add    $0x1,%eax
80100e01:	83 ec 0c             	sub    $0xc,%esp
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
80100e07:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e0c:	e8 0f 36 00 00       	call   80104420 <release>
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 d4 6f 10 80       	push   $0x80106fd4
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e3c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e41:	e8 2a 35 00 00       	call   80104370 <acquire>
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
80100e5e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp
80100e6c:	e9 af 35 00 00       	jmp    80104420 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
80100e7e:	83 ec 0c             	sub    $0xc,%esp
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
80100e90:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e98:	e8 83 35 00 00       	call   80104420 <release>
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 1a 24 00 00       	call   801032e0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ed0:	e8 6b 1c 00 00       	call   80102b40 <begin_op>
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 b0 08 00 00       	call   80101790 <iput>
80100ee0:	83 c4 10             	add    $0x10,%esp
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
80100eea:	e9 c1 1c 00 00       	jmp    80102bb0 <end_op>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 dc 6f 10 80       	push   $0x80106fdc
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 46 07 00 00       	call   80101660 <ilock>
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 e9 09 00 00       	call   80101910 <stati>
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 10 08 00 00       	call   80101740 <iunlock>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 e1 06 00 00       	call   80101660 <ilock>
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 b4 09 00 00       	call   80101940 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 9d 07 00 00       	call   80101740 <iunlock>
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	89 f0                	mov    %esi,%eax
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
80100fbd:	e9 be 24 00 00       	jmp    80103480 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 e6 6f 10 80       	push   $0x80106fe6
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101028:	01 46 14             	add    %eax,0x14(%esi)
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101034:	e8 07 07 00 00       	call   80101740 <iunlock>
80101039:	e8 72 1b 00 00       	call   80102bb0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
8010104c:	01 c7                	add    %eax,%edi
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
80101066:	e8 d5 1a 00 00       	call   80102b40 <begin_op>
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 ea 05 00 00       	call   80101660 <ilock>
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 b8 09 00 00       	call   80101a40 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 a3 06 00 00       	call   80101740 <iunlock>
8010109d:	e8 0e 1b 00 00       	call   80102bb0 <end_op>
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	e9 9f 22 00 00       	jmp    80103380 <pipewrite>
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 ef 6f 10 80       	push   $0x80106fef
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 f5 6f 10 80       	push   $0x80106ff5
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <bfree>:
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	56                   	push   %esi
80101104:	53                   	push   %ebx
80101105:	89 d3                	mov    %edx,%ebx
80101107:	c1 ea 0c             	shr    $0xc,%edx
8010110a:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101110:	83 ec 08             	sub    $0x8,%esp
80101113:	52                   	push   %edx
80101114:	50                   	push   %eax
80101115:	e8 b6 ef ff ff       	call   801000d0 <bread>
8010111a:	89 d9                	mov    %ebx,%ecx
8010111c:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101122:	ba 01 00 00 00       	mov    $0x1,%edx
80101127:	83 e1 07             	and    $0x7,%ecx
8010112a:	c1 fb 03             	sar    $0x3,%ebx
8010112d:	83 c4 10             	add    $0x10,%esp
80101130:	d3 e2                	shl    %cl,%edx
80101132:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101137:	85 d1                	test   %edx,%ecx
80101139:	74 27                	je     80101162 <bfree+0x62>
8010113b:	89 c6                	mov    %eax,%esi
8010113d:	f7 d2                	not    %edx
8010113f:	89 c8                	mov    %ecx,%eax
80101141:	83 ec 0c             	sub    $0xc,%esp
80101144:	21 d0                	and    %edx,%eax
80101146:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010114a:	56                   	push   %esi
8010114b:	e8 d0 1b 00 00       	call   80102d20 <log_write>
80101150:	89 34 24             	mov    %esi,(%esp)
80101153:	e8 88 f0 ff ff       	call   801001e0 <brelse>
80101158:	83 c4 10             	add    $0x10,%esp
8010115b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010115e:	5b                   	pop    %ebx
8010115f:	5e                   	pop    %esi
80101160:	5d                   	pop    %ebp
80101161:	c3                   	ret    
80101162:	83 ec 0c             	sub    $0xc,%esp
80101165:	68 ff 6f 10 80       	push   $0x80106fff
8010116a:	e8 01 f2 ff ff       	call   80100370 <panic>
8010116f:	90                   	nop

80101170 <balloc>:
80101170:	55                   	push   %ebp
80101171:	89 e5                	mov    %esp,%ebp
80101173:	57                   	push   %edi
80101174:	56                   	push   %esi
80101175:	53                   	push   %ebx
80101176:	83 ec 1c             	sub    $0x1c,%esp
80101179:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010117f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101182:	85 c9                	test   %ecx,%ecx
80101184:	0f 84 85 00 00 00    	je     8010120f <balloc+0x9f>
8010118a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101191:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101194:	83 ec 08             	sub    $0x8,%esp
80101197:	89 f0                	mov    %esi,%eax
80101199:	c1 f8 0c             	sar    $0xc,%eax
8010119c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
801011a2:	50                   	push   %eax
801011a3:	ff 75 d8             	pushl  -0x28(%ebp)
801011a6:	e8 25 ef ff ff       	call   801000d0 <bread>
801011ab:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801011ae:	a1 c0 09 11 80       	mov    0x801109c0,%eax
801011b3:	83 c4 10             	add    $0x10,%esp
801011b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801011b9:	31 c0                	xor    %eax,%eax
801011bb:	eb 2d                	jmp    801011ea <balloc+0x7a>
801011bd:	8d 76 00             	lea    0x0(%esi),%esi
801011c0:	89 c1                	mov    %eax,%ecx
801011c2:	ba 01 00 00 00       	mov    $0x1,%edx
801011c7:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801011ca:	83 e1 07             	and    $0x7,%ecx
801011cd:	d3 e2                	shl    %cl,%edx
801011cf:	89 c1                	mov    %eax,%ecx
801011d1:	c1 f9 03             	sar    $0x3,%ecx
801011d4:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
801011d9:	85 d7                	test   %edx,%edi
801011db:	74 43                	je     80101220 <balloc+0xb0>
801011dd:	83 c0 01             	add    $0x1,%eax
801011e0:	83 c6 01             	add    $0x1,%esi
801011e3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011e8:	74 05                	je     801011ef <balloc+0x7f>
801011ea:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801011ed:	72 d1                	jb     801011c0 <balloc+0x50>
801011ef:	83 ec 0c             	sub    $0xc,%esp
801011f2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
801011fa:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101201:	83 c4 10             	add    $0x10,%esp
80101204:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101207:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
8010120d:	77 82                	ja     80101191 <balloc+0x21>
8010120f:	83 ec 0c             	sub    $0xc,%esp
80101212:	68 12 70 10 80       	push   $0x80107012
80101217:	e8 54 f1 ff ff       	call   80100370 <panic>
8010121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101220:	09 fa                	or     %edi,%edx
80101222:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101225:	83 ec 0c             	sub    $0xc,%esp
80101228:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
8010122c:	57                   	push   %edi
8010122d:	e8 ee 1a 00 00       	call   80102d20 <log_write>
80101232:	89 3c 24             	mov    %edi,(%esp)
80101235:	e8 a6 ef ff ff       	call   801001e0 <brelse>
8010123a:	58                   	pop    %eax
8010123b:	5a                   	pop    %edx
8010123c:	56                   	push   %esi
8010123d:	ff 75 d8             	pushl  -0x28(%ebp)
80101240:	e8 8b ee ff ff       	call   801000d0 <bread>
80101245:	89 c3                	mov    %eax,%ebx
80101247:	8d 40 5c             	lea    0x5c(%eax),%eax
8010124a:	83 c4 0c             	add    $0xc,%esp
8010124d:	68 00 02 00 00       	push   $0x200
80101252:	6a 00                	push   $0x0
80101254:	50                   	push   %eax
80101255:	e8 16 32 00 00       	call   80104470 <memset>
8010125a:	89 1c 24             	mov    %ebx,(%esp)
8010125d:	e8 be 1a 00 00       	call   80102d20 <log_write>
80101262:	89 1c 24             	mov    %ebx,(%esp)
80101265:	e8 76 ef ff ff       	call   801001e0 <brelse>
8010126a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010126d:	89 f0                	mov    %esi,%eax
8010126f:	5b                   	pop    %ebx
80101270:	5e                   	pop    %esi
80101271:	5f                   	pop    %edi
80101272:	5d                   	pop    %ebp
80101273:	c3                   	ret    
80101274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010127a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101280 <iget>:
80101280:	55                   	push   %ebp
80101281:	89 e5                	mov    %esp,%ebp
80101283:	57                   	push   %edi
80101284:	56                   	push   %esi
80101285:	53                   	push   %ebx
80101286:	89 c7                	mov    %eax,%edi
80101288:	31 f6                	xor    %esi,%esi
8010128a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010128f:	83 ec 28             	sub    $0x28,%esp
80101292:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101295:	68 e0 09 11 80       	push   $0x801109e0
8010129a:	e8 d1 30 00 00       	call   80104370 <acquire>
8010129f:	83 c4 10             	add    $0x10,%esp
801012a2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801012a5:	eb 1b                	jmp    801012c2 <iget+0x42>
801012a7:	89 f6                	mov    %esi,%esi
801012a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801012b0:	85 f6                	test   %esi,%esi
801012b2:	74 44                	je     801012f8 <iget+0x78>
801012b4:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012ba:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
801012c0:	74 4e                	je     80101310 <iget+0x90>
801012c2:	8b 4b 08             	mov    0x8(%ebx),%ecx
801012c5:	85 c9                	test   %ecx,%ecx
801012c7:	7e e7                	jle    801012b0 <iget+0x30>
801012c9:	39 3b                	cmp    %edi,(%ebx)
801012cb:	75 e3                	jne    801012b0 <iget+0x30>
801012cd:	39 53 04             	cmp    %edx,0x4(%ebx)
801012d0:	75 de                	jne    801012b0 <iget+0x30>
801012d2:	83 ec 0c             	sub    $0xc,%esp
801012d5:	83 c1 01             	add    $0x1,%ecx
801012d8:	89 de                	mov    %ebx,%esi
801012da:	68 e0 09 11 80       	push   $0x801109e0
801012df:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012e2:	e8 39 31 00 00       	call   80104420 <release>
801012e7:	83 c4 10             	add    $0x10,%esp
801012ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ed:	89 f0                	mov    %esi,%eax
801012ef:	5b                   	pop    %ebx
801012f0:	5e                   	pop    %esi
801012f1:	5f                   	pop    %edi
801012f2:	5d                   	pop    %ebp
801012f3:	c3                   	ret    
801012f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012f8:	85 c9                	test   %ecx,%ecx
801012fa:	0f 44 f3             	cmove  %ebx,%esi
801012fd:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101303:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
80101309:	75 b7                	jne    801012c2 <iget+0x42>
8010130b:	90                   	nop
8010130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101310:	85 f6                	test   %esi,%esi
80101312:	74 2d                	je     80101341 <iget+0xc1>
80101314:	83 ec 0c             	sub    $0xc,%esp
80101317:	89 3e                	mov    %edi,(%esi)
80101319:	89 56 04             	mov    %edx,0x4(%esi)
8010131c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101323:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010132a:	68 e0 09 11 80       	push   $0x801109e0
8010132f:	e8 ec 30 00 00       	call   80104420 <release>
80101334:	83 c4 10             	add    $0x10,%esp
80101337:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133a:	89 f0                	mov    %esi,%eax
8010133c:	5b                   	pop    %ebx
8010133d:	5e                   	pop    %esi
8010133e:	5f                   	pop    %edi
8010133f:	5d                   	pop    %ebp
80101340:	c3                   	ret    
80101341:	83 ec 0c             	sub    $0xc,%esp
80101344:	68 28 70 10 80       	push   $0x80107028
80101349:	e8 22 f0 ff ff       	call   80100370 <panic>
8010134e:	66 90                	xchg   %ax,%ax

80101350 <bmap>:
80101350:	55                   	push   %ebp
80101351:	89 e5                	mov    %esp,%ebp
80101353:	57                   	push   %edi
80101354:	56                   	push   %esi
80101355:	53                   	push   %ebx
80101356:	89 c6                	mov    %eax,%esi
80101358:	83 ec 1c             	sub    $0x1c,%esp
8010135b:	83 fa 0b             	cmp    $0xb,%edx
8010135e:	77 18                	ja     80101378 <bmap+0x28>
80101360:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80101363:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101366:	85 c0                	test   %eax,%eax
80101368:	74 76                	je     801013e0 <bmap+0x90>
8010136a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010136d:	5b                   	pop    %ebx
8010136e:	5e                   	pop    %esi
8010136f:	5f                   	pop    %edi
80101370:	5d                   	pop    %ebp
80101371:	c3                   	ret    
80101372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101378:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010137b:	83 fb 7f             	cmp    $0x7f,%ebx
8010137e:	0f 87 83 00 00 00    	ja     80101407 <bmap+0xb7>
80101384:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010138a:	85 c0                	test   %eax,%eax
8010138c:	74 6a                	je     801013f8 <bmap+0xa8>
8010138e:	83 ec 08             	sub    $0x8,%esp
80101391:	50                   	push   %eax
80101392:	ff 36                	pushl  (%esi)
80101394:	e8 37 ed ff ff       	call   801000d0 <bread>
80101399:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010139d:	83 c4 10             	add    $0x10,%esp
801013a0:	89 c7                	mov    %eax,%edi
801013a2:	8b 1a                	mov    (%edx),%ebx
801013a4:	85 db                	test   %ebx,%ebx
801013a6:	75 1d                	jne    801013c5 <bmap+0x75>
801013a8:	8b 06                	mov    (%esi),%eax
801013aa:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801013ad:	e8 be fd ff ff       	call   80101170 <balloc>
801013b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801013b5:	83 ec 0c             	sub    $0xc,%esp
801013b8:	89 c3                	mov    %eax,%ebx
801013ba:	89 02                	mov    %eax,(%edx)
801013bc:	57                   	push   %edi
801013bd:	e8 5e 19 00 00       	call   80102d20 <log_write>
801013c2:	83 c4 10             	add    $0x10,%esp
801013c5:	83 ec 0c             	sub    $0xc,%esp
801013c8:	57                   	push   %edi
801013c9:	e8 12 ee ff ff       	call   801001e0 <brelse>
801013ce:	83 c4 10             	add    $0x10,%esp
801013d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013d4:	89 d8                	mov    %ebx,%eax
801013d6:	5b                   	pop    %ebx
801013d7:	5e                   	pop    %esi
801013d8:	5f                   	pop    %edi
801013d9:	5d                   	pop    %ebp
801013da:	c3                   	ret    
801013db:	90                   	nop
801013dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013e0:	8b 06                	mov    (%esi),%eax
801013e2:	e8 89 fd ff ff       	call   80101170 <balloc>
801013e7:	89 43 5c             	mov    %eax,0x5c(%ebx)
801013ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013ed:	5b                   	pop    %ebx
801013ee:	5e                   	pop    %esi
801013ef:	5f                   	pop    %edi
801013f0:	5d                   	pop    %ebp
801013f1:	c3                   	ret    
801013f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013f8:	8b 06                	mov    (%esi),%eax
801013fa:	e8 71 fd ff ff       	call   80101170 <balloc>
801013ff:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101405:	eb 87                	jmp    8010138e <bmap+0x3e>
80101407:	83 ec 0c             	sub    $0xc,%esp
8010140a:	68 38 70 10 80       	push   $0x80107038
8010140f:	e8 5c ef ff ff       	call   80100370 <panic>
80101414:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010141a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101420 <readsb>:
80101420:	55                   	push   %ebp
80101421:	89 e5                	mov    %esp,%ebp
80101423:	56                   	push   %esi
80101424:	53                   	push   %ebx
80101425:	8b 75 0c             	mov    0xc(%ebp),%esi
80101428:	83 ec 08             	sub    $0x8,%esp
8010142b:	6a 01                	push   $0x1
8010142d:	ff 75 08             	pushl  0x8(%ebp)
80101430:	e8 9b ec ff ff       	call   801000d0 <bread>
80101435:	89 c3                	mov    %eax,%ebx
80101437:	8d 40 5c             	lea    0x5c(%eax),%eax
8010143a:	83 c4 0c             	add    $0xc,%esp
8010143d:	6a 1c                	push   $0x1c
8010143f:	50                   	push   %eax
80101440:	56                   	push   %esi
80101441:	e8 da 30 00 00       	call   80104520 <memmove>
80101446:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101449:	83 c4 10             	add    $0x10,%esp
8010144c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010144f:	5b                   	pop    %ebx
80101450:	5e                   	pop    %esi
80101451:	5d                   	pop    %ebp
80101452:	e9 89 ed ff ff       	jmp    801001e0 <brelse>
80101457:	89 f6                	mov    %esi,%esi
80101459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101460 <iinit>:
80101460:	55                   	push   %ebp
80101461:	89 e5                	mov    %esp,%ebp
80101463:	53                   	push   %ebx
80101464:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101469:	83 ec 0c             	sub    $0xc,%esp
8010146c:	68 4b 70 10 80       	push   $0x8010704b
80101471:	68 e0 09 11 80       	push   $0x801109e0
80101476:	e8 95 2d 00 00       	call   80104210 <initlock>
8010147b:	83 c4 10             	add    $0x10,%esp
8010147e:	66 90                	xchg   %ax,%ax
80101480:	83 ec 08             	sub    $0x8,%esp
80101483:	68 52 70 10 80       	push   $0x80107052
80101488:	53                   	push   %ebx
80101489:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010148f:	e8 4c 2c 00 00       	call   801040e0 <initsleeplock>
80101494:	83 c4 10             	add    $0x10,%esp
80101497:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
8010149d:	75 e1                	jne    80101480 <iinit+0x20>
8010149f:	83 ec 08             	sub    $0x8,%esp
801014a2:	68 c0 09 11 80       	push   $0x801109c0
801014a7:	ff 75 08             	pushl  0x8(%ebp)
801014aa:	e8 71 ff ff ff       	call   80101420 <readsb>
801014af:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014b5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014bb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014c1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014c7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014cd:	ff 35 c4 09 11 80    	pushl  0x801109c4
801014d3:	ff 35 c0 09 11 80    	pushl  0x801109c0
801014d9:	68 b8 70 10 80       	push   $0x801070b8
801014de:	e8 7d f1 ff ff       	call   80100660 <cprintf>
801014e3:	83 c4 30             	add    $0x30,%esp
801014e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014e9:	c9                   	leave  
801014ea:	c3                   	ret    
801014eb:	90                   	nop
801014ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801014f0 <ialloc>:
801014f0:	55                   	push   %ebp
801014f1:	89 e5                	mov    %esp,%ebp
801014f3:	57                   	push   %edi
801014f4:	56                   	push   %esi
801014f5:	53                   	push   %ebx
801014f6:	83 ec 1c             	sub    $0x1c,%esp
801014f9:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101500:	8b 45 0c             	mov    0xc(%ebp),%eax
80101503:	8b 75 08             	mov    0x8(%ebp),%esi
80101506:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101509:	0f 86 91 00 00 00    	jbe    801015a0 <ialloc+0xb0>
8010150f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101514:	eb 21                	jmp    80101537 <ialloc+0x47>
80101516:	8d 76 00             	lea    0x0(%esi),%esi
80101519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101520:	83 ec 0c             	sub    $0xc,%esp
80101523:	83 c3 01             	add    $0x1,%ebx
80101526:	57                   	push   %edi
80101527:	e8 b4 ec ff ff       	call   801001e0 <brelse>
8010152c:	83 c4 10             	add    $0x10,%esp
8010152f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101535:	76 69                	jbe    801015a0 <ialloc+0xb0>
80101537:	89 d8                	mov    %ebx,%eax
80101539:	83 ec 08             	sub    $0x8,%esp
8010153c:	c1 e8 03             	shr    $0x3,%eax
8010153f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101545:	50                   	push   %eax
80101546:	56                   	push   %esi
80101547:	e8 84 eb ff ff       	call   801000d0 <bread>
8010154c:	89 c7                	mov    %eax,%edi
8010154e:	89 d8                	mov    %ebx,%eax
80101550:	83 c4 10             	add    $0x10,%esp
80101553:	83 e0 07             	and    $0x7,%eax
80101556:	c1 e0 06             	shl    $0x6,%eax
80101559:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010155d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101561:	75 bd                	jne    80101520 <ialloc+0x30>
80101563:	83 ec 04             	sub    $0x4,%esp
80101566:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101569:	6a 40                	push   $0x40
8010156b:	6a 00                	push   $0x0
8010156d:	51                   	push   %ecx
8010156e:	e8 fd 2e 00 00       	call   80104470 <memset>
80101573:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101577:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010157a:	66 89 01             	mov    %ax,(%ecx)
8010157d:	89 3c 24             	mov    %edi,(%esp)
80101580:	e8 9b 17 00 00       	call   80102d20 <log_write>
80101585:	89 3c 24             	mov    %edi,(%esp)
80101588:	e8 53 ec ff ff       	call   801001e0 <brelse>
8010158d:	83 c4 10             	add    $0x10,%esp
80101590:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101593:	89 da                	mov    %ebx,%edx
80101595:	89 f0                	mov    %esi,%eax
80101597:	5b                   	pop    %ebx
80101598:	5e                   	pop    %esi
80101599:	5f                   	pop    %edi
8010159a:	5d                   	pop    %ebp
8010159b:	e9 e0 fc ff ff       	jmp    80101280 <iget>
801015a0:	83 ec 0c             	sub    $0xc,%esp
801015a3:	68 58 70 10 80       	push   $0x80107058
801015a8:	e8 c3 ed ff ff       	call   80100370 <panic>
801015ad:	8d 76 00             	lea    0x0(%esi),%esi

801015b0 <iupdate>:
801015b0:	55                   	push   %ebp
801015b1:	89 e5                	mov    %esp,%ebp
801015b3:	56                   	push   %esi
801015b4:	53                   	push   %ebx
801015b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015b8:	83 ec 08             	sub    $0x8,%esp
801015bb:	8b 43 04             	mov    0x4(%ebx),%eax
801015be:	83 c3 5c             	add    $0x5c,%ebx
801015c1:	c1 e8 03             	shr    $0x3,%eax
801015c4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015ca:	50                   	push   %eax
801015cb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015ce:	e8 fd ea ff ff       	call   801000d0 <bread>
801015d3:	89 c6                	mov    %eax,%esi
801015d5:	8b 43 a8             	mov    -0x58(%ebx),%eax
801015d8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
801015dc:	83 c4 0c             	add    $0xc,%esp
801015df:	83 e0 07             	and    $0x7,%eax
801015e2:	c1 e0 06             	shl    $0x6,%eax
801015e5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801015e9:	66 89 10             	mov    %dx,(%eax)
801015ec:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
801015f0:	83 c0 0c             	add    $0xc,%eax
801015f3:	66 89 50 f6          	mov    %dx,-0xa(%eax)
801015f7:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
801015fb:	66 89 50 f8          	mov    %dx,-0x8(%eax)
801015ff:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101603:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101607:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010160a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010160d:	6a 34                	push   $0x34
8010160f:	53                   	push   %ebx
80101610:	50                   	push   %eax
80101611:	e8 0a 2f 00 00       	call   80104520 <memmove>
80101616:	89 34 24             	mov    %esi,(%esp)
80101619:	e8 02 17 00 00       	call   80102d20 <log_write>
8010161e:	89 75 08             	mov    %esi,0x8(%ebp)
80101621:	83 c4 10             	add    $0x10,%esp
80101624:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101627:	5b                   	pop    %ebx
80101628:	5e                   	pop    %esi
80101629:	5d                   	pop    %ebp
8010162a:	e9 b1 eb ff ff       	jmp    801001e0 <brelse>
8010162f:	90                   	nop

80101630 <idup>:
80101630:	55                   	push   %ebp
80101631:	89 e5                	mov    %esp,%ebp
80101633:	53                   	push   %ebx
80101634:	83 ec 10             	sub    $0x10,%esp
80101637:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010163a:	68 e0 09 11 80       	push   $0x801109e0
8010163f:	e8 2c 2d 00 00       	call   80104370 <acquire>
80101644:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101648:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010164f:	e8 cc 2d 00 00       	call   80104420 <release>
80101654:	89 d8                	mov    %ebx,%eax
80101656:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101659:	c9                   	leave  
8010165a:	c3                   	ret    
8010165b:	90                   	nop
8010165c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101660 <ilock>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	56                   	push   %esi
80101664:	53                   	push   %ebx
80101665:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101668:	85 db                	test   %ebx,%ebx
8010166a:	0f 84 b7 00 00 00    	je     80101727 <ilock+0xc7>
80101670:	8b 53 08             	mov    0x8(%ebx),%edx
80101673:	85 d2                	test   %edx,%edx
80101675:	0f 8e ac 00 00 00    	jle    80101727 <ilock+0xc7>
8010167b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010167e:	83 ec 0c             	sub    $0xc,%esp
80101681:	50                   	push   %eax
80101682:	e8 99 2a 00 00       	call   80104120 <acquiresleep>
80101687:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010168a:	83 c4 10             	add    $0x10,%esp
8010168d:	85 c0                	test   %eax,%eax
8010168f:	74 0f                	je     801016a0 <ilock+0x40>
80101691:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101694:	5b                   	pop    %ebx
80101695:	5e                   	pop    %esi
80101696:	5d                   	pop    %ebp
80101697:	c3                   	ret    
80101698:	90                   	nop
80101699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016a0:	8b 43 04             	mov    0x4(%ebx),%eax
801016a3:	83 ec 08             	sub    $0x8,%esp
801016a6:	c1 e8 03             	shr    $0x3,%eax
801016a9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016af:	50                   	push   %eax
801016b0:	ff 33                	pushl  (%ebx)
801016b2:	e8 19 ea ff ff       	call   801000d0 <bread>
801016b7:	89 c6                	mov    %eax,%esi
801016b9:	8b 43 04             	mov    0x4(%ebx),%eax
801016bc:	83 c4 0c             	add    $0xc,%esp
801016bf:	83 e0 07             	and    $0x7,%eax
801016c2:	c1 e0 06             	shl    $0x6,%eax
801016c5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016c9:	0f b7 10             	movzwl (%eax),%edx
801016cc:	83 c0 0c             	add    $0xc,%eax
801016cf:	66 89 53 50          	mov    %dx,0x50(%ebx)
801016d3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016d7:	66 89 53 52          	mov    %dx,0x52(%ebx)
801016db:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016df:	66 89 53 54          	mov    %dx,0x54(%ebx)
801016e3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016e7:	66 89 53 56          	mov    %dx,0x56(%ebx)
801016eb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016ee:	89 53 58             	mov    %edx,0x58(%ebx)
801016f1:	6a 34                	push   $0x34
801016f3:	50                   	push   %eax
801016f4:	8d 43 5c             	lea    0x5c(%ebx),%eax
801016f7:	50                   	push   %eax
801016f8:	e8 23 2e 00 00       	call   80104520 <memmove>
801016fd:	89 34 24             	mov    %esi,(%esp)
80101700:	e8 db ea ff ff       	call   801001e0 <brelse>
80101705:	83 c4 10             	add    $0x10,%esp
80101708:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010170d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101714:	0f 85 77 ff ff ff    	jne    80101691 <ilock+0x31>
8010171a:	83 ec 0c             	sub    $0xc,%esp
8010171d:	68 70 70 10 80       	push   $0x80107070
80101722:	e8 49 ec ff ff       	call   80100370 <panic>
80101727:	83 ec 0c             	sub    $0xc,%esp
8010172a:	68 6a 70 10 80       	push   $0x8010706a
8010172f:	e8 3c ec ff ff       	call   80100370 <panic>
80101734:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010173a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101740 <iunlock>:
80101740:	55                   	push   %ebp
80101741:	89 e5                	mov    %esp,%ebp
80101743:	56                   	push   %esi
80101744:	53                   	push   %ebx
80101745:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101748:	85 db                	test   %ebx,%ebx
8010174a:	74 28                	je     80101774 <iunlock+0x34>
8010174c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010174f:	83 ec 0c             	sub    $0xc,%esp
80101752:	56                   	push   %esi
80101753:	e8 68 2a 00 00       	call   801041c0 <holdingsleep>
80101758:	83 c4 10             	add    $0x10,%esp
8010175b:	85 c0                	test   %eax,%eax
8010175d:	74 15                	je     80101774 <iunlock+0x34>
8010175f:	8b 43 08             	mov    0x8(%ebx),%eax
80101762:	85 c0                	test   %eax,%eax
80101764:	7e 0e                	jle    80101774 <iunlock+0x34>
80101766:	89 75 08             	mov    %esi,0x8(%ebp)
80101769:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010176c:	5b                   	pop    %ebx
8010176d:	5e                   	pop    %esi
8010176e:	5d                   	pop    %ebp
8010176f:	e9 0c 2a 00 00       	jmp    80104180 <releasesleep>
80101774:	83 ec 0c             	sub    $0xc,%esp
80101777:	68 7f 70 10 80       	push   $0x8010707f
8010177c:	e8 ef eb ff ff       	call   80100370 <panic>
80101781:	eb 0d                	jmp    80101790 <iput>
80101783:	90                   	nop
80101784:	90                   	nop
80101785:	90                   	nop
80101786:	90                   	nop
80101787:	90                   	nop
80101788:	90                   	nop
80101789:	90                   	nop
8010178a:	90                   	nop
8010178b:	90                   	nop
8010178c:	90                   	nop
8010178d:	90                   	nop
8010178e:	90                   	nop
8010178f:	90                   	nop

80101790 <iput>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	57                   	push   %edi
80101794:	56                   	push   %esi
80101795:	53                   	push   %ebx
80101796:	83 ec 28             	sub    $0x28,%esp
80101799:	8b 75 08             	mov    0x8(%ebp),%esi
8010179c:	8d 7e 0c             	lea    0xc(%esi),%edi
8010179f:	57                   	push   %edi
801017a0:	e8 7b 29 00 00       	call   80104120 <acquiresleep>
801017a5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	85 d2                	test   %edx,%edx
801017ad:	74 07                	je     801017b6 <iput+0x26>
801017af:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017b4:	74 32                	je     801017e8 <iput+0x58>
801017b6:	83 ec 0c             	sub    $0xc,%esp
801017b9:	57                   	push   %edi
801017ba:	e8 c1 29 00 00       	call   80104180 <releasesleep>
801017bf:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017c6:	e8 a5 2b 00 00       	call   80104370 <acquire>
801017cb:	83 6e 08 01          	subl   $0x1,0x8(%esi)
801017cf:	83 c4 10             	add    $0x10,%esp
801017d2:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
801017d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017dc:	5b                   	pop    %ebx
801017dd:	5e                   	pop    %esi
801017de:	5f                   	pop    %edi
801017df:	5d                   	pop    %ebp
801017e0:	e9 3b 2c 00 00       	jmp    80104420 <release>
801017e5:	8d 76 00             	lea    0x0(%esi),%esi
801017e8:	83 ec 0c             	sub    $0xc,%esp
801017eb:	68 e0 09 11 80       	push   $0x801109e0
801017f0:	e8 7b 2b 00 00       	call   80104370 <acquire>
801017f5:	8b 5e 08             	mov    0x8(%esi),%ebx
801017f8:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017ff:	e8 1c 2c 00 00       	call   80104420 <release>
80101804:	83 c4 10             	add    $0x10,%esp
80101807:	83 fb 01             	cmp    $0x1,%ebx
8010180a:	75 aa                	jne    801017b6 <iput+0x26>
8010180c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101812:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101815:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101818:	89 cf                	mov    %ecx,%edi
8010181a:	eb 0b                	jmp    80101827 <iput+0x97>
8010181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101820:	83 c3 04             	add    $0x4,%ebx
80101823:	39 fb                	cmp    %edi,%ebx
80101825:	74 19                	je     80101840 <iput+0xb0>
80101827:	8b 13                	mov    (%ebx),%edx
80101829:	85 d2                	test   %edx,%edx
8010182b:	74 f3                	je     80101820 <iput+0x90>
8010182d:	8b 06                	mov    (%esi),%eax
8010182f:	e8 cc f8 ff ff       	call   80101100 <bfree>
80101834:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010183a:	eb e4                	jmp    80101820 <iput+0x90>
8010183c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101840:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101846:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101849:	85 c0                	test   %eax,%eax
8010184b:	75 33                	jne    80101880 <iput+0xf0>
8010184d:	83 ec 0c             	sub    $0xc,%esp
80101850:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
80101857:	56                   	push   %esi
80101858:	e8 53 fd ff ff       	call   801015b0 <iupdate>
8010185d:	31 c0                	xor    %eax,%eax
8010185f:	66 89 46 50          	mov    %ax,0x50(%esi)
80101863:	89 34 24             	mov    %esi,(%esp)
80101866:	e8 45 fd ff ff       	call   801015b0 <iupdate>
8010186b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101872:	83 c4 10             	add    $0x10,%esp
80101875:	e9 3c ff ff ff       	jmp    801017b6 <iput+0x26>
8010187a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101880:	83 ec 08             	sub    $0x8,%esp
80101883:	50                   	push   %eax
80101884:	ff 36                	pushl  (%esi)
80101886:	e8 45 e8 ff ff       	call   801000d0 <bread>
8010188b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
80101891:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101894:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101897:	8d 58 5c             	lea    0x5c(%eax),%ebx
8010189a:	83 c4 10             	add    $0x10,%esp
8010189d:	89 cf                	mov    %ecx,%edi
8010189f:	eb 0e                	jmp    801018af <iput+0x11f>
801018a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018a8:	83 c3 04             	add    $0x4,%ebx
801018ab:	39 fb                	cmp    %edi,%ebx
801018ad:	74 0f                	je     801018be <iput+0x12e>
801018af:	8b 13                	mov    (%ebx),%edx
801018b1:	85 d2                	test   %edx,%edx
801018b3:	74 f3                	je     801018a8 <iput+0x118>
801018b5:	8b 06                	mov    (%esi),%eax
801018b7:	e8 44 f8 ff ff       	call   80101100 <bfree>
801018bc:	eb ea                	jmp    801018a8 <iput+0x118>
801018be:	83 ec 0c             	sub    $0xc,%esp
801018c1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018c4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018c7:	e8 14 e9 ff ff       	call   801001e0 <brelse>
801018cc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018d2:	8b 06                	mov    (%esi),%eax
801018d4:	e8 27 f8 ff ff       	call   80101100 <bfree>
801018d9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018e0:	00 00 00 
801018e3:	83 c4 10             	add    $0x10,%esp
801018e6:	e9 62 ff ff ff       	jmp    8010184d <iput+0xbd>
801018eb:	90                   	nop
801018ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801018f0 <iunlockput>:
801018f0:	55                   	push   %ebp
801018f1:	89 e5                	mov    %esp,%ebp
801018f3:	53                   	push   %ebx
801018f4:	83 ec 10             	sub    $0x10,%esp
801018f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801018fa:	53                   	push   %ebx
801018fb:	e8 40 fe ff ff       	call   80101740 <iunlock>
80101900:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101903:	83 c4 10             	add    $0x10,%esp
80101906:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101909:	c9                   	leave  
8010190a:	e9 81 fe ff ff       	jmp    80101790 <iput>
8010190f:	90                   	nop

80101910 <stati>:
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	8b 55 08             	mov    0x8(%ebp),%edx
80101916:	8b 45 0c             	mov    0xc(%ebp),%eax
80101919:	8b 0a                	mov    (%edx),%ecx
8010191b:	89 48 04             	mov    %ecx,0x4(%eax)
8010191e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101921:	89 48 08             	mov    %ecx,0x8(%eax)
80101924:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101928:	66 89 08             	mov    %cx,(%eax)
8010192b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010192f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101933:	8b 52 58             	mov    0x58(%edx),%edx
80101936:	89 50 10             	mov    %edx,0x10(%eax)
80101939:	5d                   	pop    %ebp
8010193a:	c3                   	ret    
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <readi>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	57                   	push   %edi
80101944:	56                   	push   %esi
80101945:	53                   	push   %ebx
80101946:	83 ec 1c             	sub    $0x1c,%esp
80101949:	8b 45 08             	mov    0x8(%ebp),%eax
8010194c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010194f:	8b 75 10             	mov    0x10(%ebp),%esi
80101952:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101957:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010195a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010195d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101960:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101963:	0f 84 a7 00 00 00    	je     80101a10 <readi+0xd0>
80101969:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010196c:	8b 40 58             	mov    0x58(%eax),%eax
8010196f:	39 f0                	cmp    %esi,%eax
80101971:	0f 82 c1 00 00 00    	jb     80101a38 <readi+0xf8>
80101977:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010197a:	89 fa                	mov    %edi,%edx
8010197c:	01 f2                	add    %esi,%edx
8010197e:	0f 82 b4 00 00 00    	jb     80101a38 <readi+0xf8>
80101984:	89 c1                	mov    %eax,%ecx
80101986:	29 f1                	sub    %esi,%ecx
80101988:	39 d0                	cmp    %edx,%eax
8010198a:	0f 43 cf             	cmovae %edi,%ecx
8010198d:	31 ff                	xor    %edi,%edi
8010198f:	85 c9                	test   %ecx,%ecx
80101991:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101994:	74 6d                	je     80101a03 <readi+0xc3>
80101996:	8d 76 00             	lea    0x0(%esi),%esi
80101999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019a0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019a3:	89 f2                	mov    %esi,%edx
801019a5:	c1 ea 09             	shr    $0x9,%edx
801019a8:	89 d8                	mov    %ebx,%eax
801019aa:	e8 a1 f9 ff ff       	call   80101350 <bmap>
801019af:	83 ec 08             	sub    $0x8,%esp
801019b2:	50                   	push   %eax
801019b3:	ff 33                	pushl  (%ebx)
801019b5:	bb 00 02 00 00       	mov    $0x200,%ebx
801019ba:	e8 11 e7 ff ff       	call   801000d0 <bread>
801019bf:	89 c2                	mov    %eax,%edx
801019c1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019c4:	89 f1                	mov    %esi,%ecx
801019c6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019cc:	83 c4 0c             	add    $0xc,%esp
801019cf:	89 55 dc             	mov    %edx,-0x24(%ebp)
801019d2:	29 cb                	sub    %ecx,%ebx
801019d4:	29 f8                	sub    %edi,%eax
801019d6:	39 c3                	cmp    %eax,%ebx
801019d8:	0f 47 d8             	cmova  %eax,%ebx
801019db:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019df:	53                   	push   %ebx
801019e0:	01 df                	add    %ebx,%edi
801019e2:	01 de                	add    %ebx,%esi
801019e4:	50                   	push   %eax
801019e5:	ff 75 e0             	pushl  -0x20(%ebp)
801019e8:	e8 33 2b 00 00       	call   80104520 <memmove>
801019ed:	8b 55 dc             	mov    -0x24(%ebp),%edx
801019f0:	89 14 24             	mov    %edx,(%esp)
801019f3:	e8 e8 e7 ff ff       	call   801001e0 <brelse>
801019f8:	01 5d e0             	add    %ebx,-0x20(%ebp)
801019fb:	83 c4 10             	add    $0x10,%esp
801019fe:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a01:	77 9d                	ja     801019a0 <readi+0x60>
80101a03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a06:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a09:	5b                   	pop    %ebx
80101a0a:	5e                   	pop    %esi
80101a0b:	5f                   	pop    %edi
80101a0c:	5d                   	pop    %ebp
80101a0d:	c3                   	ret    
80101a0e:	66 90                	xchg   %ax,%ax
80101a10:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a14:	66 83 f8 09          	cmp    $0x9,%ax
80101a18:	77 1e                	ja     80101a38 <readi+0xf8>
80101a1a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a21:	85 c0                	test   %eax,%eax
80101a23:	74 13                	je     80101a38 <readi+0xf8>
80101a25:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a2b:	5b                   	pop    %ebx
80101a2c:	5e                   	pop    %esi
80101a2d:	5f                   	pop    %edi
80101a2e:	5d                   	pop    %ebp
80101a2f:	ff e0                	jmp    *%eax
80101a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a38:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a3d:	eb c7                	jmp    80101a06 <readi+0xc6>
80101a3f:	90                   	nop

80101a40 <writei>:
80101a40:	55                   	push   %ebp
80101a41:	89 e5                	mov    %esp,%ebp
80101a43:	57                   	push   %edi
80101a44:	56                   	push   %esi
80101a45:	53                   	push   %ebx
80101a46:	83 ec 1c             	sub    $0x1c,%esp
80101a49:	8b 45 08             	mov    0x8(%ebp),%eax
80101a4c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a4f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a52:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a57:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a5a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a5d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a60:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a63:	0f 84 b7 00 00 00    	je     80101b20 <writei+0xe0>
80101a69:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a6c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a6f:	0f 82 eb 00 00 00    	jb     80101b60 <writei+0x120>
80101a75:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a78:	89 f8                	mov    %edi,%eax
80101a7a:	01 f0                	add    %esi,%eax
80101a7c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a81:	0f 87 d9 00 00 00    	ja     80101b60 <writei+0x120>
80101a87:	39 c6                	cmp    %eax,%esi
80101a89:	0f 87 d1 00 00 00    	ja     80101b60 <writei+0x120>
80101a8f:	85 ff                	test   %edi,%edi
80101a91:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101a98:	74 78                	je     80101b12 <writei+0xd2>
80101a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101aa0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101aa3:	89 f2                	mov    %esi,%edx
80101aa5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101aaa:	c1 ea 09             	shr    $0x9,%edx
80101aad:	89 f8                	mov    %edi,%eax
80101aaf:	e8 9c f8 ff ff       	call   80101350 <bmap>
80101ab4:	83 ec 08             	sub    $0x8,%esp
80101ab7:	50                   	push   %eax
80101ab8:	ff 37                	pushl  (%edi)
80101aba:	e8 11 e6 ff ff       	call   801000d0 <bread>
80101abf:	89 c7                	mov    %eax,%edi
80101ac1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ac4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ac7:	89 f1                	mov    %esi,%ecx
80101ac9:	83 c4 0c             	add    $0xc,%esp
80101acc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ad2:	29 cb                	sub    %ecx,%ebx
80101ad4:	39 c3                	cmp    %eax,%ebx
80101ad6:	0f 47 d8             	cmova  %eax,%ebx
80101ad9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101add:	53                   	push   %ebx
80101ade:	ff 75 dc             	pushl  -0x24(%ebp)
80101ae1:	01 de                	add    %ebx,%esi
80101ae3:	50                   	push   %eax
80101ae4:	e8 37 2a 00 00       	call   80104520 <memmove>
80101ae9:	89 3c 24             	mov    %edi,(%esp)
80101aec:	e8 2f 12 00 00       	call   80102d20 <log_write>
80101af1:	89 3c 24             	mov    %edi,(%esp)
80101af4:	e8 e7 e6 ff ff       	call   801001e0 <brelse>
80101af9:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101afc:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101aff:	83 c4 10             	add    $0x10,%esp
80101b02:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b05:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b08:	77 96                	ja     80101aa0 <writei+0x60>
80101b0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b0d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b10:	77 36                	ja     80101b48 <writei+0x108>
80101b12:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b15:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b18:	5b                   	pop    %ebx
80101b19:	5e                   	pop    %esi
80101b1a:	5f                   	pop    %edi
80101b1b:	5d                   	pop    %ebp
80101b1c:	c3                   	ret    
80101b1d:	8d 76 00             	lea    0x0(%esi),%esi
80101b20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b24:	66 83 f8 09          	cmp    $0x9,%ax
80101b28:	77 36                	ja     80101b60 <writei+0x120>
80101b2a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b31:	85 c0                	test   %eax,%eax
80101b33:	74 2b                	je     80101b60 <writei+0x120>
80101b35:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b3b:	5b                   	pop    %ebx
80101b3c:	5e                   	pop    %esi
80101b3d:	5f                   	pop    %edi
80101b3e:	5d                   	pop    %ebp
80101b3f:	ff e0                	jmp    *%eax
80101b41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b48:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b4b:	83 ec 0c             	sub    $0xc,%esp
80101b4e:	89 70 58             	mov    %esi,0x58(%eax)
80101b51:	50                   	push   %eax
80101b52:	e8 59 fa ff ff       	call   801015b0 <iupdate>
80101b57:	83 c4 10             	add    $0x10,%esp
80101b5a:	eb b6                	jmp    80101b12 <writei+0xd2>
80101b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b65:	eb ae                	jmp    80101b15 <writei+0xd5>
80101b67:	89 f6                	mov    %esi,%esi
80101b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b70 <namecmp>:
80101b70:	55                   	push   %ebp
80101b71:	89 e5                	mov    %esp,%ebp
80101b73:	83 ec 0c             	sub    $0xc,%esp
80101b76:	6a 0e                	push   $0xe
80101b78:	ff 75 0c             	pushl  0xc(%ebp)
80101b7b:	ff 75 08             	pushl  0x8(%ebp)
80101b7e:	e8 1d 2a 00 00       	call   801045a0 <strncmp>
80101b83:	c9                   	leave  
80101b84:	c3                   	ret    
80101b85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <dirlookup>:
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	57                   	push   %edi
80101b94:	56                   	push   %esi
80101b95:	53                   	push   %ebx
80101b96:	83 ec 1c             	sub    $0x1c,%esp
80101b99:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101b9c:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101ba1:	0f 85 80 00 00 00    	jne    80101c27 <dirlookup+0x97>
80101ba7:	8b 53 58             	mov    0x58(%ebx),%edx
80101baa:	31 ff                	xor    %edi,%edi
80101bac:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101baf:	85 d2                	test   %edx,%edx
80101bb1:	75 0d                	jne    80101bc0 <dirlookup+0x30>
80101bb3:	eb 5b                	jmp    80101c10 <dirlookup+0x80>
80101bb5:	8d 76 00             	lea    0x0(%esi),%esi
80101bb8:	83 c7 10             	add    $0x10,%edi
80101bbb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bbe:	76 50                	jbe    80101c10 <dirlookup+0x80>
80101bc0:	6a 10                	push   $0x10
80101bc2:	57                   	push   %edi
80101bc3:	56                   	push   %esi
80101bc4:	53                   	push   %ebx
80101bc5:	e8 76 fd ff ff       	call   80101940 <readi>
80101bca:	83 c4 10             	add    $0x10,%esp
80101bcd:	83 f8 10             	cmp    $0x10,%eax
80101bd0:	75 48                	jne    80101c1a <dirlookup+0x8a>
80101bd2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bd7:	74 df                	je     80101bb8 <dirlookup+0x28>
80101bd9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bdc:	83 ec 04             	sub    $0x4,%esp
80101bdf:	6a 0e                	push   $0xe
80101be1:	50                   	push   %eax
80101be2:	ff 75 0c             	pushl  0xc(%ebp)
80101be5:	e8 b6 29 00 00       	call   801045a0 <strncmp>
80101bea:	83 c4 10             	add    $0x10,%esp
80101bed:	85 c0                	test   %eax,%eax
80101bef:	75 c7                	jne    80101bb8 <dirlookup+0x28>
80101bf1:	8b 45 10             	mov    0x10(%ebp),%eax
80101bf4:	85 c0                	test   %eax,%eax
80101bf6:	74 05                	je     80101bfd <dirlookup+0x6d>
80101bf8:	8b 45 10             	mov    0x10(%ebp),%eax
80101bfb:	89 38                	mov    %edi,(%eax)
80101bfd:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c01:	8b 03                	mov    (%ebx),%eax
80101c03:	e8 78 f6 ff ff       	call   80101280 <iget>
80101c08:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c0b:	5b                   	pop    %ebx
80101c0c:	5e                   	pop    %esi
80101c0d:	5f                   	pop    %edi
80101c0e:	5d                   	pop    %ebp
80101c0f:	c3                   	ret    
80101c10:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c13:	31 c0                	xor    %eax,%eax
80101c15:	5b                   	pop    %ebx
80101c16:	5e                   	pop    %esi
80101c17:	5f                   	pop    %edi
80101c18:	5d                   	pop    %ebp
80101c19:	c3                   	ret    
80101c1a:	83 ec 0c             	sub    $0xc,%esp
80101c1d:	68 99 70 10 80       	push   $0x80107099
80101c22:	e8 49 e7 ff ff       	call   80100370 <panic>
80101c27:	83 ec 0c             	sub    $0xc,%esp
80101c2a:	68 87 70 10 80       	push   $0x80107087
80101c2f:	e8 3c e7 ff ff       	call   80100370 <panic>
80101c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c40 <namex>:
80101c40:	55                   	push   %ebp
80101c41:	89 e5                	mov    %esp,%ebp
80101c43:	57                   	push   %edi
80101c44:	56                   	push   %esi
80101c45:	53                   	push   %ebx
80101c46:	89 cf                	mov    %ecx,%edi
80101c48:	89 c3                	mov    %eax,%ebx
80101c4a:	83 ec 1c             	sub    $0x1c,%esp
80101c4d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c50:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c53:	0f 84 53 01 00 00    	je     80101dac <namex+0x16c>
80101c59:	e8 12 1b 00 00       	call   80103770 <myproc>
80101c5e:	83 ec 0c             	sub    $0xc,%esp
80101c61:	8b 70 68             	mov    0x68(%eax),%esi
80101c64:	68 e0 09 11 80       	push   $0x801109e0
80101c69:	e8 02 27 00 00       	call   80104370 <acquire>
80101c6e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101c72:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101c79:	e8 a2 27 00 00       	call   80104420 <release>
80101c7e:	83 c4 10             	add    $0x10,%esp
80101c81:	eb 08                	jmp    80101c8b <namex+0x4b>
80101c83:	90                   	nop
80101c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c88:	83 c3 01             	add    $0x1,%ebx
80101c8b:	0f b6 03             	movzbl (%ebx),%eax
80101c8e:	3c 2f                	cmp    $0x2f,%al
80101c90:	74 f6                	je     80101c88 <namex+0x48>
80101c92:	84 c0                	test   %al,%al
80101c94:	0f 84 e3 00 00 00    	je     80101d7d <namex+0x13d>
80101c9a:	0f b6 03             	movzbl (%ebx),%eax
80101c9d:	89 da                	mov    %ebx,%edx
80101c9f:	84 c0                	test   %al,%al
80101ca1:	0f 84 ac 00 00 00    	je     80101d53 <namex+0x113>
80101ca7:	3c 2f                	cmp    $0x2f,%al
80101ca9:	75 09                	jne    80101cb4 <namex+0x74>
80101cab:	e9 a3 00 00 00       	jmp    80101d53 <namex+0x113>
80101cb0:	84 c0                	test   %al,%al
80101cb2:	74 0a                	je     80101cbe <namex+0x7e>
80101cb4:	83 c2 01             	add    $0x1,%edx
80101cb7:	0f b6 02             	movzbl (%edx),%eax
80101cba:	3c 2f                	cmp    $0x2f,%al
80101cbc:	75 f2                	jne    80101cb0 <namex+0x70>
80101cbe:	89 d1                	mov    %edx,%ecx
80101cc0:	29 d9                	sub    %ebx,%ecx
80101cc2:	83 f9 0d             	cmp    $0xd,%ecx
80101cc5:	0f 8e 8d 00 00 00    	jle    80101d58 <namex+0x118>
80101ccb:	83 ec 04             	sub    $0x4,%esp
80101cce:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cd1:	6a 0e                	push   $0xe
80101cd3:	53                   	push   %ebx
80101cd4:	57                   	push   %edi
80101cd5:	e8 46 28 00 00       	call   80104520 <memmove>
80101cda:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101cdd:	83 c4 10             	add    $0x10,%esp
80101ce0:	89 d3                	mov    %edx,%ebx
80101ce2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101ce5:	75 11                	jne    80101cf8 <namex+0xb8>
80101ce7:	89 f6                	mov    %esi,%esi
80101ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101cf0:	83 c3 01             	add    $0x1,%ebx
80101cf3:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101cf6:	74 f8                	je     80101cf0 <namex+0xb0>
80101cf8:	83 ec 0c             	sub    $0xc,%esp
80101cfb:	56                   	push   %esi
80101cfc:	e8 5f f9 ff ff       	call   80101660 <ilock>
80101d01:	83 c4 10             	add    $0x10,%esp
80101d04:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d09:	0f 85 7f 00 00 00    	jne    80101d8e <namex+0x14e>
80101d0f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d12:	85 d2                	test   %edx,%edx
80101d14:	74 09                	je     80101d1f <namex+0xdf>
80101d16:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d19:	0f 84 a3 00 00 00    	je     80101dc2 <namex+0x182>
80101d1f:	83 ec 04             	sub    $0x4,%esp
80101d22:	6a 00                	push   $0x0
80101d24:	57                   	push   %edi
80101d25:	56                   	push   %esi
80101d26:	e8 65 fe ff ff       	call   80101b90 <dirlookup>
80101d2b:	83 c4 10             	add    $0x10,%esp
80101d2e:	85 c0                	test   %eax,%eax
80101d30:	74 5c                	je     80101d8e <namex+0x14e>
80101d32:	83 ec 0c             	sub    $0xc,%esp
80101d35:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d38:	56                   	push   %esi
80101d39:	e8 02 fa ff ff       	call   80101740 <iunlock>
80101d3e:	89 34 24             	mov    %esi,(%esp)
80101d41:	e8 4a fa ff ff       	call   80101790 <iput>
80101d46:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d49:	83 c4 10             	add    $0x10,%esp
80101d4c:	89 c6                	mov    %eax,%esi
80101d4e:	e9 38 ff ff ff       	jmp    80101c8b <namex+0x4b>
80101d53:	31 c9                	xor    %ecx,%ecx
80101d55:	8d 76 00             	lea    0x0(%esi),%esi
80101d58:	83 ec 04             	sub    $0x4,%esp
80101d5b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d5e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d61:	51                   	push   %ecx
80101d62:	53                   	push   %ebx
80101d63:	57                   	push   %edi
80101d64:	e8 b7 27 00 00       	call   80104520 <memmove>
80101d69:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d6c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d6f:	83 c4 10             	add    $0x10,%esp
80101d72:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d76:	89 d3                	mov    %edx,%ebx
80101d78:	e9 65 ff ff ff       	jmp    80101ce2 <namex+0xa2>
80101d7d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d80:	85 c0                	test   %eax,%eax
80101d82:	75 54                	jne    80101dd8 <namex+0x198>
80101d84:	89 f0                	mov    %esi,%eax
80101d86:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d89:	5b                   	pop    %ebx
80101d8a:	5e                   	pop    %esi
80101d8b:	5f                   	pop    %edi
80101d8c:	5d                   	pop    %ebp
80101d8d:	c3                   	ret    
80101d8e:	83 ec 0c             	sub    $0xc,%esp
80101d91:	56                   	push   %esi
80101d92:	e8 a9 f9 ff ff       	call   80101740 <iunlock>
80101d97:	89 34 24             	mov    %esi,(%esp)
80101d9a:	e8 f1 f9 ff ff       	call   80101790 <iput>
80101d9f:	83 c4 10             	add    $0x10,%esp
80101da2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da5:	31 c0                	xor    %eax,%eax
80101da7:	5b                   	pop    %ebx
80101da8:	5e                   	pop    %esi
80101da9:	5f                   	pop    %edi
80101daa:	5d                   	pop    %ebp
80101dab:	c3                   	ret    
80101dac:	ba 01 00 00 00       	mov    $0x1,%edx
80101db1:	b8 01 00 00 00       	mov    $0x1,%eax
80101db6:	e8 c5 f4 ff ff       	call   80101280 <iget>
80101dbb:	89 c6                	mov    %eax,%esi
80101dbd:	e9 c9 fe ff ff       	jmp    80101c8b <namex+0x4b>
80101dc2:	83 ec 0c             	sub    $0xc,%esp
80101dc5:	56                   	push   %esi
80101dc6:	e8 75 f9 ff ff       	call   80101740 <iunlock>
80101dcb:	83 c4 10             	add    $0x10,%esp
80101dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dd1:	89 f0                	mov    %esi,%eax
80101dd3:	5b                   	pop    %ebx
80101dd4:	5e                   	pop    %esi
80101dd5:	5f                   	pop    %edi
80101dd6:	5d                   	pop    %ebp
80101dd7:	c3                   	ret    
80101dd8:	83 ec 0c             	sub    $0xc,%esp
80101ddb:	56                   	push   %esi
80101ddc:	e8 af f9 ff ff       	call   80101790 <iput>
80101de1:	83 c4 10             	add    $0x10,%esp
80101de4:	31 c0                	xor    %eax,%eax
80101de6:	eb 9e                	jmp    80101d86 <namex+0x146>
80101de8:	90                   	nop
80101de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101df0 <dirlink>:
80101df0:	55                   	push   %ebp
80101df1:	89 e5                	mov    %esp,%ebp
80101df3:	57                   	push   %edi
80101df4:	56                   	push   %esi
80101df5:	53                   	push   %ebx
80101df6:	83 ec 20             	sub    $0x20,%esp
80101df9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101dfc:	6a 00                	push   $0x0
80101dfe:	ff 75 0c             	pushl  0xc(%ebp)
80101e01:	53                   	push   %ebx
80101e02:	e8 89 fd ff ff       	call   80101b90 <dirlookup>
80101e07:	83 c4 10             	add    $0x10,%esp
80101e0a:	85 c0                	test   %eax,%eax
80101e0c:	75 67                	jne    80101e75 <dirlink+0x85>
80101e0e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e11:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e14:	85 ff                	test   %edi,%edi
80101e16:	74 29                	je     80101e41 <dirlink+0x51>
80101e18:	31 ff                	xor    %edi,%edi
80101e1a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e1d:	eb 09                	jmp    80101e28 <dirlink+0x38>
80101e1f:	90                   	nop
80101e20:	83 c7 10             	add    $0x10,%edi
80101e23:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e26:	76 19                	jbe    80101e41 <dirlink+0x51>
80101e28:	6a 10                	push   $0x10
80101e2a:	57                   	push   %edi
80101e2b:	56                   	push   %esi
80101e2c:	53                   	push   %ebx
80101e2d:	e8 0e fb ff ff       	call   80101940 <readi>
80101e32:	83 c4 10             	add    $0x10,%esp
80101e35:	83 f8 10             	cmp    $0x10,%eax
80101e38:	75 4e                	jne    80101e88 <dirlink+0x98>
80101e3a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e3f:	75 df                	jne    80101e20 <dirlink+0x30>
80101e41:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e44:	83 ec 04             	sub    $0x4,%esp
80101e47:	6a 0e                	push   $0xe
80101e49:	ff 75 0c             	pushl  0xc(%ebp)
80101e4c:	50                   	push   %eax
80101e4d:	e8 be 27 00 00       	call   80104610 <strncpy>
80101e52:	8b 45 10             	mov    0x10(%ebp),%eax
80101e55:	6a 10                	push   $0x10
80101e57:	57                   	push   %edi
80101e58:	56                   	push   %esi
80101e59:	53                   	push   %ebx
80101e5a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e5e:	e8 dd fb ff ff       	call   80101a40 <writei>
80101e63:	83 c4 20             	add    $0x20,%esp
80101e66:	83 f8 10             	cmp    $0x10,%eax
80101e69:	75 2a                	jne    80101e95 <dirlink+0xa5>
80101e6b:	31 c0                	xor    %eax,%eax
80101e6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e70:	5b                   	pop    %ebx
80101e71:	5e                   	pop    %esi
80101e72:	5f                   	pop    %edi
80101e73:	5d                   	pop    %ebp
80101e74:	c3                   	ret    
80101e75:	83 ec 0c             	sub    $0xc,%esp
80101e78:	50                   	push   %eax
80101e79:	e8 12 f9 ff ff       	call   80101790 <iput>
80101e7e:	83 c4 10             	add    $0x10,%esp
80101e81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e86:	eb e5                	jmp    80101e6d <dirlink+0x7d>
80101e88:	83 ec 0c             	sub    $0xc,%esp
80101e8b:	68 a8 70 10 80       	push   $0x801070a8
80101e90:	e8 db e4 ff ff       	call   80100370 <panic>
80101e95:	83 ec 0c             	sub    $0xc,%esp
80101e98:	68 c2 76 10 80       	push   $0x801076c2
80101e9d:	e8 ce e4 ff ff       	call   80100370 <panic>
80101ea2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101eb0 <namei>:
80101eb0:	55                   	push   %ebp
80101eb1:	31 d2                	xor    %edx,%edx
80101eb3:	89 e5                	mov    %esp,%ebp
80101eb5:	83 ec 18             	sub    $0x18,%esp
80101eb8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ebb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ebe:	e8 7d fd ff ff       	call   80101c40 <namex>
80101ec3:	c9                   	leave  
80101ec4:	c3                   	ret    
80101ec5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ed0 <nameiparent>:
80101ed0:	55                   	push   %ebp
80101ed1:	ba 01 00 00 00       	mov    $0x1,%edx
80101ed6:	89 e5                	mov    %esp,%ebp
80101ed8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101edb:	8b 45 08             	mov    0x8(%ebp),%eax
80101ede:	5d                   	pop    %ebp
80101edf:	e9 5c fd ff ff       	jmp    80101c40 <namex>
80101ee4:	66 90                	xchg   %ax,%ax
80101ee6:	66 90                	xchg   %ax,%ax
80101ee8:	66 90                	xchg   %ax,%ax
80101eea:	66 90                	xchg   %ax,%ax
80101eec:	66 90                	xchg   %ax,%ax
80101eee:	66 90                	xchg   %ax,%ax

80101ef0 <idestart>:
80101ef0:	55                   	push   %ebp
80101ef1:	85 c0                	test   %eax,%eax
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	56                   	push   %esi
80101ef6:	53                   	push   %ebx
80101ef7:	0f 84 ad 00 00 00    	je     80101faa <idestart+0xba>
80101efd:	8b 58 08             	mov    0x8(%eax),%ebx
80101f00:	89 c1                	mov    %eax,%ecx
80101f02:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f08:	0f 87 8f 00 00 00    	ja     80101f9d <idestart+0xad>
80101f0e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f13:	90                   	nop
80101f14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f18:	ec                   	in     (%dx),%al
80101f19:	83 e0 c0             	and    $0xffffffc0,%eax
80101f1c:	3c 40                	cmp    $0x40,%al
80101f1e:	75 f8                	jne    80101f18 <idestart+0x28>
80101f20:	31 f6                	xor    %esi,%esi
80101f22:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f27:	89 f0                	mov    %esi,%eax
80101f29:	ee                   	out    %al,(%dx)
80101f2a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f2f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f34:	ee                   	out    %al,(%dx)
80101f35:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f3a:	89 d8                	mov    %ebx,%eax
80101f3c:	ee                   	out    %al,(%dx)
80101f3d:	89 d8                	mov    %ebx,%eax
80101f3f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f44:	c1 f8 08             	sar    $0x8,%eax
80101f47:	ee                   	out    %al,(%dx)
80101f48:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f4d:	89 f0                	mov    %esi,%eax
80101f4f:	ee                   	out    %al,(%dx)
80101f50:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f54:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f59:	83 e0 01             	and    $0x1,%eax
80101f5c:	c1 e0 04             	shl    $0x4,%eax
80101f5f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f62:	ee                   	out    %al,(%dx)
80101f63:	f6 01 04             	testb  $0x4,(%ecx)
80101f66:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f6b:	75 13                	jne    80101f80 <idestart+0x90>
80101f6d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f72:	ee                   	out    %al,(%dx)
80101f73:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f76:	5b                   	pop    %ebx
80101f77:	5e                   	pop    %esi
80101f78:	5d                   	pop    %ebp
80101f79:	c3                   	ret    
80101f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f80:	b8 30 00 00 00       	mov    $0x30,%eax
80101f85:	ee                   	out    %al,(%dx)
80101f86:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101f8b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f8e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101f93:	fc                   	cld    
80101f94:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101f96:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f99:	5b                   	pop    %ebx
80101f9a:	5e                   	pop    %esi
80101f9b:	5d                   	pop    %ebp
80101f9c:	c3                   	ret    
80101f9d:	83 ec 0c             	sub    $0xc,%esp
80101fa0:	68 14 71 10 80       	push   $0x80107114
80101fa5:	e8 c6 e3 ff ff       	call   80100370 <panic>
80101faa:	83 ec 0c             	sub    $0xc,%esp
80101fad:	68 0b 71 10 80       	push   $0x8010710b
80101fb2:	e8 b9 e3 ff ff       	call   80100370 <panic>
80101fb7:	89 f6                	mov    %esi,%esi
80101fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fc0 <ideinit>:
80101fc0:	55                   	push   %ebp
80101fc1:	89 e5                	mov    %esp,%ebp
80101fc3:	83 ec 10             	sub    $0x10,%esp
80101fc6:	68 26 71 10 80       	push   $0x80107126
80101fcb:	68 80 a5 10 80       	push   $0x8010a580
80101fd0:	e8 3b 22 00 00       	call   80104210 <initlock>
80101fd5:	58                   	pop    %eax
80101fd6:	a1 00 2d 11 80       	mov    0x80112d00,%eax
80101fdb:	5a                   	pop    %edx
80101fdc:	83 e8 01             	sub    $0x1,%eax
80101fdf:	50                   	push   %eax
80101fe0:	6a 0e                	push   $0xe
80101fe2:	e8 a9 02 00 00       	call   80102290 <ioapicenable>
80101fe7:	83 c4 10             	add    $0x10,%esp
80101fea:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fef:	90                   	nop
80101ff0:	ec                   	in     (%dx),%al
80101ff1:	83 e0 c0             	and    $0xffffffc0,%eax
80101ff4:	3c 40                	cmp    $0x40,%al
80101ff6:	75 f8                	jne    80101ff0 <ideinit+0x30>
80101ff8:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101ffd:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102002:	ee                   	out    %al,(%dx)
80102003:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102008:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010200d:	eb 06                	jmp    80102015 <ideinit+0x55>
8010200f:	90                   	nop
80102010:	83 e9 01             	sub    $0x1,%ecx
80102013:	74 0f                	je     80102024 <ideinit+0x64>
80102015:	ec                   	in     (%dx),%al
80102016:	84 c0                	test   %al,%al
80102018:	74 f6                	je     80102010 <ideinit+0x50>
8010201a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102021:	00 00 00 
80102024:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102029:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010202e:	ee                   	out    %al,(%dx)
8010202f:	c9                   	leave  
80102030:	c3                   	ret    
80102031:	eb 0d                	jmp    80102040 <ideintr>
80102033:	90                   	nop
80102034:	90                   	nop
80102035:	90                   	nop
80102036:	90                   	nop
80102037:	90                   	nop
80102038:	90                   	nop
80102039:	90                   	nop
8010203a:	90                   	nop
8010203b:	90                   	nop
8010203c:	90                   	nop
8010203d:	90                   	nop
8010203e:	90                   	nop
8010203f:	90                   	nop

80102040 <ideintr>:
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	57                   	push   %edi
80102044:	56                   	push   %esi
80102045:	53                   	push   %ebx
80102046:	83 ec 18             	sub    $0x18,%esp
80102049:	68 80 a5 10 80       	push   $0x8010a580
8010204e:	e8 1d 23 00 00       	call   80104370 <acquire>
80102053:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102059:	83 c4 10             	add    $0x10,%esp
8010205c:	85 db                	test   %ebx,%ebx
8010205e:	74 34                	je     80102094 <ideintr+0x54>
80102060:	8b 43 58             	mov    0x58(%ebx),%eax
80102063:	a3 64 a5 10 80       	mov    %eax,0x8010a564
80102068:	8b 33                	mov    (%ebx),%esi
8010206a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102070:	74 3e                	je     801020b0 <ideintr+0x70>
80102072:	83 e6 fb             	and    $0xfffffffb,%esi
80102075:	83 ec 0c             	sub    $0xc,%esp
80102078:	83 ce 02             	or     $0x2,%esi
8010207b:	89 33                	mov    %esi,(%ebx)
8010207d:	53                   	push   %ebx
8010207e:	e8 5d 1e 00 00       	call   80103ee0 <wakeup>
80102083:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102088:	83 c4 10             	add    $0x10,%esp
8010208b:	85 c0                	test   %eax,%eax
8010208d:	74 05                	je     80102094 <ideintr+0x54>
8010208f:	e8 5c fe ff ff       	call   80101ef0 <idestart>
80102094:	83 ec 0c             	sub    $0xc,%esp
80102097:	68 80 a5 10 80       	push   $0x8010a580
8010209c:	e8 7f 23 00 00       	call   80104420 <release>
801020a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020a4:	5b                   	pop    %ebx
801020a5:	5e                   	pop    %esi
801020a6:	5f                   	pop    %edi
801020a7:	5d                   	pop    %ebp
801020a8:	c3                   	ret    
801020a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801020b0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020b5:	8d 76 00             	lea    0x0(%esi),%esi
801020b8:	ec                   	in     (%dx),%al
801020b9:	89 c1                	mov    %eax,%ecx
801020bb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020be:	80 f9 40             	cmp    $0x40,%cl
801020c1:	75 f5                	jne    801020b8 <ideintr+0x78>
801020c3:	a8 21                	test   $0x21,%al
801020c5:	75 ab                	jne    80102072 <ideintr+0x32>
801020c7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020ca:	b9 80 00 00 00       	mov    $0x80,%ecx
801020cf:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020d4:	fc                   	cld    
801020d5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020d7:	8b 33                	mov    (%ebx),%esi
801020d9:	eb 97                	jmp    80102072 <ideintr+0x32>
801020db:	90                   	nop
801020dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020e0 <iderw>:
801020e0:	55                   	push   %ebp
801020e1:	89 e5                	mov    %esp,%ebp
801020e3:	53                   	push   %ebx
801020e4:	83 ec 10             	sub    $0x10,%esp
801020e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801020ea:	8d 43 0c             	lea    0xc(%ebx),%eax
801020ed:	50                   	push   %eax
801020ee:	e8 cd 20 00 00       	call   801041c0 <holdingsleep>
801020f3:	83 c4 10             	add    $0x10,%esp
801020f6:	85 c0                	test   %eax,%eax
801020f8:	0f 84 ad 00 00 00    	je     801021ab <iderw+0xcb>
801020fe:	8b 03                	mov    (%ebx),%eax
80102100:	83 e0 06             	and    $0x6,%eax
80102103:	83 f8 02             	cmp    $0x2,%eax
80102106:	0f 84 b9 00 00 00    	je     801021c5 <iderw+0xe5>
8010210c:	8b 53 04             	mov    0x4(%ebx),%edx
8010210f:	85 d2                	test   %edx,%edx
80102111:	74 0d                	je     80102120 <iderw+0x40>
80102113:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102118:	85 c0                	test   %eax,%eax
8010211a:	0f 84 98 00 00 00    	je     801021b8 <iderw+0xd8>
80102120:	83 ec 0c             	sub    $0xc,%esp
80102123:	68 80 a5 10 80       	push   $0x8010a580
80102128:	e8 43 22 00 00       	call   80104370 <acquire>
8010212d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102133:	83 c4 10             	add    $0x10,%esp
80102136:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010213d:	85 d2                	test   %edx,%edx
8010213f:	75 09                	jne    8010214a <iderw+0x6a>
80102141:	eb 58                	jmp    8010219b <iderw+0xbb>
80102143:	90                   	nop
80102144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102148:	89 c2                	mov    %eax,%edx
8010214a:	8b 42 58             	mov    0x58(%edx),%eax
8010214d:	85 c0                	test   %eax,%eax
8010214f:	75 f7                	jne    80102148 <iderw+0x68>
80102151:	83 c2 58             	add    $0x58,%edx
80102154:	89 1a                	mov    %ebx,(%edx)
80102156:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010215c:	74 44                	je     801021a2 <iderw+0xc2>
8010215e:	8b 03                	mov    (%ebx),%eax
80102160:	83 e0 06             	and    $0x6,%eax
80102163:	83 f8 02             	cmp    $0x2,%eax
80102166:	74 23                	je     8010218b <iderw+0xab>
80102168:	90                   	nop
80102169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102170:	83 ec 08             	sub    $0x8,%esp
80102173:	68 80 a5 10 80       	push   $0x8010a580
80102178:	53                   	push   %ebx
80102179:	e8 b2 1b 00 00       	call   80103d30 <sleep>
8010217e:	8b 03                	mov    (%ebx),%eax
80102180:	83 c4 10             	add    $0x10,%esp
80102183:	83 e0 06             	and    $0x6,%eax
80102186:	83 f8 02             	cmp    $0x2,%eax
80102189:	75 e5                	jne    80102170 <iderw+0x90>
8010218b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
80102192:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102195:	c9                   	leave  
80102196:	e9 85 22 00 00       	jmp    80104420 <release>
8010219b:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021a0:	eb b2                	jmp    80102154 <iderw+0x74>
801021a2:	89 d8                	mov    %ebx,%eax
801021a4:	e8 47 fd ff ff       	call   80101ef0 <idestart>
801021a9:	eb b3                	jmp    8010215e <iderw+0x7e>
801021ab:	83 ec 0c             	sub    $0xc,%esp
801021ae:	68 2a 71 10 80       	push   $0x8010712a
801021b3:	e8 b8 e1 ff ff       	call   80100370 <panic>
801021b8:	83 ec 0c             	sub    $0xc,%esp
801021bb:	68 55 71 10 80       	push   $0x80107155
801021c0:	e8 ab e1 ff ff       	call   80100370 <panic>
801021c5:	83 ec 0c             	sub    $0xc,%esp
801021c8:	68 40 71 10 80       	push   $0x80107140
801021cd:	e8 9e e1 ff ff       	call   80100370 <panic>
801021d2:	66 90                	xchg   %ax,%ax
801021d4:	66 90                	xchg   %ax,%ax
801021d6:	66 90                	xchg   %ax,%ax
801021d8:	66 90                	xchg   %ax,%ax
801021da:	66 90                	xchg   %ax,%ax
801021dc:	66 90                	xchg   %ax,%ax
801021de:	66 90                	xchg   %ax,%ax

801021e0 <ioapicinit>:
801021e0:	55                   	push   %ebp
801021e1:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
801021e8:	00 c0 fe 
801021eb:	89 e5                	mov    %esp,%ebp
801021ed:	56                   	push   %esi
801021ee:	53                   	push   %ebx
801021ef:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
801021f6:	00 00 00 
801021f9:	8b 15 34 26 11 80    	mov    0x80112634,%edx
801021ff:	8b 72 10             	mov    0x10(%edx),%esi
80102202:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102208:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010220e:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102215:	89 f0                	mov    %esi,%eax
80102217:	c1 e8 10             	shr    $0x10,%eax
8010221a:	0f b6 f0             	movzbl %al,%esi
8010221d:	8b 41 10             	mov    0x10(%ecx),%eax
80102220:	c1 e8 18             	shr    $0x18,%eax
80102223:	39 d0                	cmp    %edx,%eax
80102225:	74 16                	je     8010223d <ioapicinit+0x5d>
80102227:	83 ec 0c             	sub    $0xc,%esp
8010222a:	68 74 71 10 80       	push   $0x80107174
8010222f:	e8 2c e4 ff ff       	call   80100660 <cprintf>
80102234:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010223a:	83 c4 10             	add    $0x10,%esp
8010223d:	83 c6 21             	add    $0x21,%esi
80102240:	ba 10 00 00 00       	mov    $0x10,%edx
80102245:	b8 20 00 00 00       	mov    $0x20,%eax
8010224a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102250:	89 11                	mov    %edx,(%ecx)
80102252:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102258:	89 c3                	mov    %eax,%ebx
8010225a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102260:	83 c0 01             	add    $0x1,%eax
80102263:	89 59 10             	mov    %ebx,0x10(%ecx)
80102266:	8d 5a 01             	lea    0x1(%edx),%ebx
80102269:	83 c2 02             	add    $0x2,%edx
8010226c:	39 f0                	cmp    %esi,%eax
8010226e:	89 19                	mov    %ebx,(%ecx)
80102270:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102276:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010227d:	75 d1                	jne    80102250 <ioapicinit+0x70>
8010227f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102282:	5b                   	pop    %ebx
80102283:	5e                   	pop    %esi
80102284:	5d                   	pop    %ebp
80102285:	c3                   	ret    
80102286:	8d 76 00             	lea    0x0(%esi),%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102290 <ioapicenable>:
80102290:	55                   	push   %ebp
80102291:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102297:	89 e5                	mov    %esp,%ebp
80102299:	8b 45 08             	mov    0x8(%ebp),%eax
8010229c:	8d 50 20             	lea    0x20(%eax),%edx
8010229f:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022a3:	89 01                	mov    %eax,(%ecx)
801022a5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022ab:	83 c0 01             	add    $0x1,%eax
801022ae:	89 51 10             	mov    %edx,0x10(%ecx)
801022b1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022b4:	89 01                	mov    %eax,(%ecx)
801022b6:	a1 34 26 11 80       	mov    0x80112634,%eax
801022bb:	c1 e2 18             	shl    $0x18,%edx
801022be:	89 50 10             	mov    %edx,0x10(%eax)
801022c1:	5d                   	pop    %ebp
801022c2:	c3                   	ret    
801022c3:	66 90                	xchg   %ax,%ax
801022c5:	66 90                	xchg   %ax,%ax
801022c7:	66 90                	xchg   %ax,%ax
801022c9:	66 90                	xchg   %ax,%ax
801022cb:	66 90                	xchg   %ax,%ax
801022cd:	66 90                	xchg   %ax,%ax
801022cf:	90                   	nop

801022d0 <kfree>:
801022d0:	55                   	push   %ebp
801022d1:	89 e5                	mov    %esp,%ebp
801022d3:	53                   	push   %ebx
801022d4:	83 ec 04             	sub    $0x4,%esp
801022d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022da:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022e0:	75 70                	jne    80102352 <kfree+0x82>
801022e2:	81 fb a8 55 11 80    	cmp    $0x801155a8,%ebx
801022e8:	72 68                	jb     80102352 <kfree+0x82>
801022ea:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801022f0:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
801022f5:	77 5b                	ja     80102352 <kfree+0x82>
801022f7:	83 ec 04             	sub    $0x4,%esp
801022fa:	68 00 10 00 00       	push   $0x1000
801022ff:	6a 01                	push   $0x1
80102301:	53                   	push   %ebx
80102302:	e8 69 21 00 00       	call   80104470 <memset>
80102307:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010230d:	83 c4 10             	add    $0x10,%esp
80102310:	85 d2                	test   %edx,%edx
80102312:	75 2c                	jne    80102340 <kfree+0x70>
80102314:	a1 78 26 11 80       	mov    0x80112678,%eax
80102319:	89 03                	mov    %eax,(%ebx)
8010231b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102320:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102326:	85 c0                	test   %eax,%eax
80102328:	75 06                	jne    80102330 <kfree+0x60>
8010232a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010232d:	c9                   	leave  
8010232e:	c3                   	ret    
8010232f:	90                   	nop
80102330:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102337:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233a:	c9                   	leave  
8010233b:	e9 e0 20 00 00       	jmp    80104420 <release>
80102340:	83 ec 0c             	sub    $0xc,%esp
80102343:	68 40 26 11 80       	push   $0x80112640
80102348:	e8 23 20 00 00       	call   80104370 <acquire>
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	eb c2                	jmp    80102314 <kfree+0x44>
80102352:	83 ec 0c             	sub    $0xc,%esp
80102355:	68 a6 71 10 80       	push   $0x801071a6
8010235a:	e8 11 e0 ff ff       	call   80100370 <panic>
8010235f:	90                   	nop

80102360 <freerange>:
80102360:	55                   	push   %ebp
80102361:	89 e5                	mov    %esp,%ebp
80102363:	56                   	push   %esi
80102364:	53                   	push   %ebx
80102365:	8b 45 08             	mov    0x8(%ebp),%eax
80102368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010236b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102371:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102377:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010237d:	39 de                	cmp    %ebx,%esi
8010237f:	72 23                	jb     801023a4 <freerange+0x44>
80102381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102388:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010238e:	83 ec 0c             	sub    $0xc,%esp
80102391:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102397:	50                   	push   %eax
80102398:	e8 33 ff ff ff       	call   801022d0 <kfree>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	39 f3                	cmp    %esi,%ebx
801023a2:	76 e4                	jbe    80102388 <freerange+0x28>
801023a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023a7:	5b                   	pop    %ebx
801023a8:	5e                   	pop    %esi
801023a9:	5d                   	pop    %ebp
801023aa:	c3                   	ret    
801023ab:	90                   	nop
801023ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023b0 <kinit1>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023b8:	83 ec 08             	sub    $0x8,%esp
801023bb:	68 ac 71 10 80       	push   $0x801071ac
801023c0:	68 40 26 11 80       	push   $0x80112640
801023c5:	e8 46 1e 00 00       	call   80104210 <initlock>
801023ca:	8b 45 08             	mov    0x8(%ebp),%eax
801023cd:	83 c4 10             	add    $0x10,%esp
801023d0:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
801023d7:	00 00 00 
801023da:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023e0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023e6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ec:	39 de                	cmp    %ebx,%esi
801023ee:	72 1c                	jb     8010240c <kinit1+0x5c>
801023f0:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023f6:	83 ec 0c             	sub    $0xc,%esp
801023f9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023ff:	50                   	push   %eax
80102400:	e8 cb fe ff ff       	call   801022d0 <kfree>
80102405:	83 c4 10             	add    $0x10,%esp
80102408:	39 de                	cmp    %ebx,%esi
8010240a:	73 e4                	jae    801023f0 <kinit1+0x40>
8010240c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010240f:	5b                   	pop    %ebx
80102410:	5e                   	pop    %esi
80102411:	5d                   	pop    %ebp
80102412:	c3                   	ret    
80102413:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102420 <kinit2>:
80102420:	55                   	push   %ebp
80102421:	89 e5                	mov    %esp,%ebp
80102423:	56                   	push   %esi
80102424:	53                   	push   %ebx
80102425:	8b 45 08             	mov    0x8(%ebp),%eax
80102428:	8b 75 0c             	mov    0xc(%ebp),%esi
8010242b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102431:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102437:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243d:	39 de                	cmp    %ebx,%esi
8010243f:	72 23                	jb     80102464 <kinit2+0x44>
80102441:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102448:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010244e:	83 ec 0c             	sub    $0xc,%esp
80102451:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102457:	50                   	push   %eax
80102458:	e8 73 fe ff ff       	call   801022d0 <kfree>
8010245d:	83 c4 10             	add    $0x10,%esp
80102460:	39 de                	cmp    %ebx,%esi
80102462:	73 e4                	jae    80102448 <kinit2+0x28>
80102464:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
8010246b:	00 00 00 
8010246e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102471:	5b                   	pop    %ebx
80102472:	5e                   	pop    %esi
80102473:	5d                   	pop    %ebp
80102474:	c3                   	ret    
80102475:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102480 <kalloc>:
80102480:	55                   	push   %ebp
80102481:	89 e5                	mov    %esp,%ebp
80102483:	53                   	push   %ebx
80102484:	83 ec 04             	sub    $0x4,%esp
80102487:	a1 74 26 11 80       	mov    0x80112674,%eax
8010248c:	85 c0                	test   %eax,%eax
8010248e:	75 30                	jne    801024c0 <kalloc+0x40>
80102490:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
80102496:	85 db                	test   %ebx,%ebx
80102498:	74 1c                	je     801024b6 <kalloc+0x36>
8010249a:	8b 13                	mov    (%ebx),%edx
8010249c:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024a2:	85 c0                	test   %eax,%eax
801024a4:	74 10                	je     801024b6 <kalloc+0x36>
801024a6:	83 ec 0c             	sub    $0xc,%esp
801024a9:	68 40 26 11 80       	push   $0x80112640
801024ae:	e8 6d 1f 00 00       	call   80104420 <release>
801024b3:	83 c4 10             	add    $0x10,%esp
801024b6:	89 d8                	mov    %ebx,%eax
801024b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024bb:	c9                   	leave  
801024bc:	c3                   	ret    
801024bd:	8d 76 00             	lea    0x0(%esi),%esi
801024c0:	83 ec 0c             	sub    $0xc,%esp
801024c3:	68 40 26 11 80       	push   $0x80112640
801024c8:	e8 a3 1e 00 00       	call   80104370 <acquire>
801024cd:	8b 1d 78 26 11 80    	mov    0x80112678,%ebx
801024d3:	83 c4 10             	add    $0x10,%esp
801024d6:	a1 74 26 11 80       	mov    0x80112674,%eax
801024db:	85 db                	test   %ebx,%ebx
801024dd:	75 bb                	jne    8010249a <kalloc+0x1a>
801024df:	eb c1                	jmp    801024a2 <kalloc+0x22>
801024e1:	66 90                	xchg   %ax,%ax
801024e3:	66 90                	xchg   %ax,%ax
801024e5:	66 90                	xchg   %ax,%ax
801024e7:	66 90                	xchg   %ax,%ax
801024e9:	66 90                	xchg   %ax,%ax
801024eb:	66 90                	xchg   %ax,%ax
801024ed:	66 90                	xchg   %ax,%ax
801024ef:	90                   	nop

801024f0 <kbdgetc>:
801024f0:	55                   	push   %ebp
801024f1:	ba 64 00 00 00       	mov    $0x64,%edx
801024f6:	89 e5                	mov    %esp,%ebp
801024f8:	ec                   	in     (%dx),%al
801024f9:	a8 01                	test   $0x1,%al
801024fb:	0f 84 af 00 00 00    	je     801025b0 <kbdgetc+0xc0>
80102501:	ba 60 00 00 00       	mov    $0x60,%edx
80102506:	ec                   	in     (%dx),%al
80102507:	0f b6 d0             	movzbl %al,%edx
8010250a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102510:	74 7e                	je     80102590 <kbdgetc+0xa0>
80102512:	84 c0                	test   %al,%al
80102514:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010251a:	79 24                	jns    80102540 <kbdgetc+0x50>
8010251c:	f6 c1 40             	test   $0x40,%cl
8010251f:	75 05                	jne    80102526 <kbdgetc+0x36>
80102521:	89 c2                	mov    %eax,%edx
80102523:	83 e2 7f             	and    $0x7f,%edx
80102526:	0f b6 82 e0 72 10 80 	movzbl -0x7fef8d20(%edx),%eax
8010252d:	83 c8 40             	or     $0x40,%eax
80102530:	0f b6 c0             	movzbl %al,%eax
80102533:	f7 d0                	not    %eax
80102535:	21 c8                	and    %ecx,%eax
80102537:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010253c:	31 c0                	xor    %eax,%eax
8010253e:	5d                   	pop    %ebp
8010253f:	c3                   	ret    
80102540:	f6 c1 40             	test   $0x40,%cl
80102543:	74 09                	je     8010254e <kbdgetc+0x5e>
80102545:	83 c8 80             	or     $0xffffff80,%eax
80102548:	83 e1 bf             	and    $0xffffffbf,%ecx
8010254b:	0f b6 d0             	movzbl %al,%edx
8010254e:	0f b6 82 e0 72 10 80 	movzbl -0x7fef8d20(%edx),%eax
80102555:	09 c1                	or     %eax,%ecx
80102557:	0f b6 82 e0 71 10 80 	movzbl -0x7fef8e20(%edx),%eax
8010255e:	31 c1                	xor    %eax,%ecx
80102560:	89 c8                	mov    %ecx,%eax
80102562:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102568:	83 e0 03             	and    $0x3,%eax
8010256b:	83 e1 08             	and    $0x8,%ecx
8010256e:	8b 04 85 c0 71 10 80 	mov    -0x7fef8e40(,%eax,4),%eax
80102575:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102579:	74 c3                	je     8010253e <kbdgetc+0x4e>
8010257b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010257e:	83 fa 19             	cmp    $0x19,%edx
80102581:	77 1d                	ja     801025a0 <kbdgetc+0xb0>
80102583:	83 e8 20             	sub    $0x20,%eax
80102586:	5d                   	pop    %ebp
80102587:	c3                   	ret    
80102588:	90                   	nop
80102589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102590:	31 c0                	xor    %eax,%eax
80102592:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
80102599:	5d                   	pop    %ebp
8010259a:	c3                   	ret    
8010259b:	90                   	nop
8010259c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025a0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025a3:	8d 50 20             	lea    0x20(%eax),%edx
801025a6:	5d                   	pop    %ebp
801025a7:	83 f9 19             	cmp    $0x19,%ecx
801025aa:	0f 46 c2             	cmovbe %edx,%eax
801025ad:	c3                   	ret    
801025ae:	66 90                	xchg   %ax,%ax
801025b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025b5:	5d                   	pop    %ebp
801025b6:	c3                   	ret    
801025b7:	89 f6                	mov    %esi,%esi
801025b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025c0 <kbdintr>:
801025c0:	55                   	push   %ebp
801025c1:	89 e5                	mov    %esp,%ebp
801025c3:	83 ec 14             	sub    $0x14,%esp
801025c6:	68 f0 24 10 80       	push   $0x801024f0
801025cb:	e8 20 e2 ff ff       	call   801007f0 <consoleintr>
801025d0:	83 c4 10             	add    $0x10,%esp
801025d3:	c9                   	leave  
801025d4:	c3                   	ret    
801025d5:	66 90                	xchg   %ax,%ax
801025d7:	66 90                	xchg   %ax,%ax
801025d9:	66 90                	xchg   %ax,%ax
801025db:	66 90                	xchg   %ax,%ax
801025dd:	66 90                	xchg   %ax,%ax
801025df:	90                   	nop

801025e0 <lapicinit>:
801025e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801025e5:	55                   	push   %ebp
801025e6:	89 e5                	mov    %esp,%ebp
801025e8:	85 c0                	test   %eax,%eax
801025ea:	0f 84 c8 00 00 00    	je     801026b8 <lapicinit+0xd8>
801025f0:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
801025f7:	01 00 00 
801025fa:	8b 50 20             	mov    0x20(%eax),%edx
801025fd:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102604:	00 00 00 
80102607:	8b 50 20             	mov    0x20(%eax),%edx
8010260a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102611:	00 02 00 
80102614:	8b 50 20             	mov    0x20(%eax),%edx
80102617:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010261e:	96 98 00 
80102621:	8b 50 20             	mov    0x20(%eax),%edx
80102624:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010262b:	00 01 00 
8010262e:	8b 50 20             	mov    0x20(%eax),%edx
80102631:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102638:	00 01 00 
8010263b:	8b 50 20             	mov    0x20(%eax),%edx
8010263e:	8b 50 30             	mov    0x30(%eax),%edx
80102641:	c1 ea 10             	shr    $0x10,%edx
80102644:	80 fa 03             	cmp    $0x3,%dl
80102647:	77 77                	ja     801026c0 <lapicinit+0xe0>
80102649:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102650:	00 00 00 
80102653:	8b 50 20             	mov    0x20(%eax),%edx
80102656:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010265d:	00 00 00 
80102660:	8b 50 20             	mov    0x20(%eax),%edx
80102663:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266a:	00 00 00 
8010266d:	8b 50 20             	mov    0x20(%eax),%edx
80102670:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102677:	00 00 00 
8010267a:	8b 50 20             	mov    0x20(%eax),%edx
8010267d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102684:	00 00 00 
80102687:	8b 50 20             	mov    0x20(%eax),%edx
8010268a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102691:	85 08 00 
80102694:	8b 50 20             	mov    0x20(%eax),%edx
80102697:	89 f6                	mov    %esi,%esi
80102699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026a0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026a6:	80 e6 10             	and    $0x10,%dh
801026a9:	75 f5                	jne    801026a0 <lapicinit+0xc0>
801026ab:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026b2:	00 00 00 
801026b5:	8b 40 20             	mov    0x20(%eax),%eax
801026b8:	5d                   	pop    %ebp
801026b9:	c3                   	ret    
801026ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026c0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026c7:	00 01 00 
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	e9 77 ff ff ff       	jmp    80102649 <lapicinit+0x69>
801026d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026e0 <lapicid>:
801026e0:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801026e5:	55                   	push   %ebp
801026e6:	89 e5                	mov    %esp,%ebp
801026e8:	85 c0                	test   %eax,%eax
801026ea:	74 0c                	je     801026f8 <lapicid+0x18>
801026ec:	8b 40 20             	mov    0x20(%eax),%eax
801026ef:	5d                   	pop    %ebp
801026f0:	c1 e8 18             	shr    $0x18,%eax
801026f3:	c3                   	ret    
801026f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801026f8:	31 c0                	xor    %eax,%eax
801026fa:	5d                   	pop    %ebp
801026fb:	c3                   	ret    
801026fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102700 <lapiceoi>:
80102700:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102705:	55                   	push   %ebp
80102706:	89 e5                	mov    %esp,%ebp
80102708:	85 c0                	test   %eax,%eax
8010270a:	74 0d                	je     80102719 <lapiceoi+0x19>
8010270c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102713:	00 00 00 
80102716:	8b 40 20             	mov    0x20(%eax),%eax
80102719:	5d                   	pop    %ebp
8010271a:	c3                   	ret    
8010271b:	90                   	nop
8010271c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102720 <microdelay>:
80102720:	55                   	push   %ebp
80102721:	89 e5                	mov    %esp,%ebp
80102723:	5d                   	pop    %ebp
80102724:	c3                   	ret    
80102725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <lapicstartap>:
80102730:	55                   	push   %ebp
80102731:	ba 70 00 00 00       	mov    $0x70,%edx
80102736:	b8 0f 00 00 00       	mov    $0xf,%eax
8010273b:	89 e5                	mov    %esp,%ebp
8010273d:	53                   	push   %ebx
8010273e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102741:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102744:	ee                   	out    %al,(%dx)
80102745:	ba 71 00 00 00       	mov    $0x71,%edx
8010274a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010274f:	ee                   	out    %al,(%dx)
80102750:	31 c0                	xor    %eax,%eax
80102752:	c1 e3 18             	shl    $0x18,%ebx
80102755:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010275b:	89 c8                	mov    %ecx,%eax
8010275d:	c1 e9 0c             	shr    $0xc,%ecx
80102760:	c1 e8 04             	shr    $0x4,%eax
80102763:	89 da                	mov    %ebx,%edx
80102765:	80 cd 06             	or     $0x6,%ch
80102768:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010276e:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102773:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102779:	8b 58 20             	mov    0x20(%eax),%ebx
8010277c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102783:	c5 00 00 
80102786:	8b 58 20             	mov    0x20(%eax),%ebx
80102789:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102790:	85 00 00 
80102793:	8b 58 20             	mov    0x20(%eax),%ebx
80102796:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010279c:	8b 58 20             	mov    0x20(%eax),%ebx
8010279f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027a5:	8b 58 20             	mov    0x20(%eax),%ebx
801027a8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ae:	8b 50 20             	mov    0x20(%eax),%edx
801027b1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b7:	8b 40 20             	mov    0x20(%eax),%eax
801027ba:	5b                   	pop    %ebx
801027bb:	5d                   	pop    %ebp
801027bc:	c3                   	ret    
801027bd:	8d 76 00             	lea    0x0(%esi),%esi

801027c0 <cmostime>:
801027c0:	55                   	push   %ebp
801027c1:	ba 70 00 00 00       	mov    $0x70,%edx
801027c6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027cb:	89 e5                	mov    %esp,%ebp
801027cd:	57                   	push   %edi
801027ce:	56                   	push   %esi
801027cf:	53                   	push   %ebx
801027d0:	83 ec 4c             	sub    $0x4c,%esp
801027d3:	ee                   	out    %al,(%dx)
801027d4:	ba 71 00 00 00       	mov    $0x71,%edx
801027d9:	ec                   	in     (%dx),%al
801027da:	83 e0 04             	and    $0x4,%eax
801027dd:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027e0:	31 db                	xor    %ebx,%ebx
801027e2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027e5:	bf 70 00 00 00       	mov    $0x70,%edi
801027ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801027f0:	89 d8                	mov    %ebx,%eax
801027f2:	89 fa                	mov    %edi,%edx
801027f4:	ee                   	out    %al,(%dx)
801027f5:	b9 71 00 00 00       	mov    $0x71,%ecx
801027fa:	89 ca                	mov    %ecx,%edx
801027fc:	ec                   	in     (%dx),%al
801027fd:	0f b6 c0             	movzbl %al,%eax
80102800:	89 fa                	mov    %edi,%edx
80102802:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102805:	b8 02 00 00 00       	mov    $0x2,%eax
8010280a:	ee                   	out    %al,(%dx)
8010280b:	89 ca                	mov    %ecx,%edx
8010280d:	ec                   	in     (%dx),%al
8010280e:	0f b6 c0             	movzbl %al,%eax
80102811:	89 fa                	mov    %edi,%edx
80102813:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102816:	b8 04 00 00 00       	mov    $0x4,%eax
8010281b:	ee                   	out    %al,(%dx)
8010281c:	89 ca                	mov    %ecx,%edx
8010281e:	ec                   	in     (%dx),%al
8010281f:	0f b6 c0             	movzbl %al,%eax
80102822:	89 fa                	mov    %edi,%edx
80102824:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102827:	b8 07 00 00 00       	mov    $0x7,%eax
8010282c:	ee                   	out    %al,(%dx)
8010282d:	89 ca                	mov    %ecx,%edx
8010282f:	ec                   	in     (%dx),%al
80102830:	0f b6 c0             	movzbl %al,%eax
80102833:	89 fa                	mov    %edi,%edx
80102835:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102838:	b8 08 00 00 00       	mov    $0x8,%eax
8010283d:	ee                   	out    %al,(%dx)
8010283e:	89 ca                	mov    %ecx,%edx
80102840:	ec                   	in     (%dx),%al
80102841:	0f b6 c0             	movzbl %al,%eax
80102844:	89 fa                	mov    %edi,%edx
80102846:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102849:	b8 09 00 00 00       	mov    $0x9,%eax
8010284e:	ee                   	out    %al,(%dx)
8010284f:	89 ca                	mov    %ecx,%edx
80102851:	ec                   	in     (%dx),%al
80102852:	0f b6 c0             	movzbl %al,%eax
80102855:	89 fa                	mov    %edi,%edx
80102857:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010285a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010285f:	ee                   	out    %al,(%dx)
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	84 c0                	test   %al,%al
80102865:	78 89                	js     801027f0 <cmostime+0x30>
80102867:	89 d8                	mov    %ebx,%eax
80102869:	89 fa                	mov    %edi,%edx
8010286b:	ee                   	out    %al,(%dx)
8010286c:	89 ca                	mov    %ecx,%edx
8010286e:	ec                   	in     (%dx),%al
8010286f:	0f b6 c0             	movzbl %al,%eax
80102872:	89 fa                	mov    %edi,%edx
80102874:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102877:	b8 02 00 00 00       	mov    $0x2,%eax
8010287c:	ee                   	out    %al,(%dx)
8010287d:	89 ca                	mov    %ecx,%edx
8010287f:	ec                   	in     (%dx),%al
80102880:	0f b6 c0             	movzbl %al,%eax
80102883:	89 fa                	mov    %edi,%edx
80102885:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102888:	b8 04 00 00 00       	mov    $0x4,%eax
8010288d:	ee                   	out    %al,(%dx)
8010288e:	89 ca                	mov    %ecx,%edx
80102890:	ec                   	in     (%dx),%al
80102891:	0f b6 c0             	movzbl %al,%eax
80102894:	89 fa                	mov    %edi,%edx
80102896:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102899:	b8 07 00 00 00       	mov    $0x7,%eax
8010289e:	ee                   	out    %al,(%dx)
8010289f:	89 ca                	mov    %ecx,%edx
801028a1:	ec                   	in     (%dx),%al
801028a2:	0f b6 c0             	movzbl %al,%eax
801028a5:	89 fa                	mov    %edi,%edx
801028a7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028aa:	b8 08 00 00 00       	mov    $0x8,%eax
801028af:	ee                   	out    %al,(%dx)
801028b0:	89 ca                	mov    %ecx,%edx
801028b2:	ec                   	in     (%dx),%al
801028b3:	0f b6 c0             	movzbl %al,%eax
801028b6:	89 fa                	mov    %edi,%edx
801028b8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028bb:	b8 09 00 00 00       	mov    $0x9,%eax
801028c0:	ee                   	out    %al,(%dx)
801028c1:	89 ca                	mov    %ecx,%edx
801028c3:	ec                   	in     (%dx),%al
801028c4:	0f b6 c0             	movzbl %al,%eax
801028c7:	83 ec 04             	sub    $0x4,%esp
801028ca:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028cd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028d0:	6a 18                	push   $0x18
801028d2:	56                   	push   %esi
801028d3:	50                   	push   %eax
801028d4:	e8 e7 1b 00 00       	call   801044c0 <memcmp>
801028d9:	83 c4 10             	add    $0x10,%esp
801028dc:	85 c0                	test   %eax,%eax
801028de:	0f 85 0c ff ff ff    	jne    801027f0 <cmostime+0x30>
801028e4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028e8:	75 78                	jne    80102962 <cmostime+0x1a2>
801028ea:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028ed:	89 c2                	mov    %eax,%edx
801028ef:	83 e0 0f             	and    $0xf,%eax
801028f2:	c1 ea 04             	shr    $0x4,%edx
801028f5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801028f8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801028fb:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028fe:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102901:	89 c2                	mov    %eax,%edx
80102903:	83 e0 0f             	and    $0xf,%eax
80102906:	c1 ea 04             	shr    $0x4,%edx
80102909:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010290c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102912:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102915:	89 c2                	mov    %eax,%edx
80102917:	83 e0 0f             	and    $0xf,%eax
8010291a:	c1 ea 04             	shr    $0x4,%edx
8010291d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102920:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102923:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102926:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102929:	89 c2                	mov    %eax,%edx
8010292b:	83 e0 0f             	and    $0xf,%eax
8010292e:	c1 ea 04             	shr    $0x4,%edx
80102931:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102934:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102937:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010293a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010294e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102951:	89 c2                	mov    %eax,%edx
80102953:	83 e0 0f             	and    $0xf,%eax
80102956:	c1 ea 04             	shr    $0x4,%edx
80102959:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102962:	8b 75 08             	mov    0x8(%ebp),%esi
80102965:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102968:	89 06                	mov    %eax,(%esi)
8010296a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010296d:	89 46 04             	mov    %eax,0x4(%esi)
80102970:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102973:	89 46 08             	mov    %eax,0x8(%esi)
80102976:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102979:	89 46 0c             	mov    %eax,0xc(%esi)
8010297c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010297f:	89 46 10             	mov    %eax,0x10(%esi)
80102982:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102985:	89 46 14             	mov    %eax,0x14(%esi)
80102988:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010298f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102992:	5b                   	pop    %ebx
80102993:	5e                   	pop    %esi
80102994:	5f                   	pop    %edi
80102995:	5d                   	pop    %ebp
80102996:	c3                   	ret    
80102997:	66 90                	xchg   %ax,%ax
80102999:	66 90                	xchg   %ax,%ax
8010299b:	66 90                	xchg   %ax,%ax
8010299d:	66 90                	xchg   %ax,%ax
8010299f:	90                   	nop

801029a0 <install_trans>:
801029a0:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
801029a6:	85 c9                	test   %ecx,%ecx
801029a8:	0f 8e 85 00 00 00    	jle    80102a33 <install_trans+0x93>
801029ae:	55                   	push   %ebp
801029af:	89 e5                	mov    %esp,%ebp
801029b1:	57                   	push   %edi
801029b2:	56                   	push   %esi
801029b3:	53                   	push   %ebx
801029b4:	31 db                	xor    %ebx,%ebx
801029b6:	83 ec 0c             	sub    $0xc,%esp
801029b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029c0:	a1 b4 26 11 80       	mov    0x801126b4,%eax
801029c5:	83 ec 08             	sub    $0x8,%esp
801029c8:	01 d8                	add    %ebx,%eax
801029ca:	83 c0 01             	add    $0x1,%eax
801029cd:	50                   	push   %eax
801029ce:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029d4:	e8 f7 d6 ff ff       	call   801000d0 <bread>
801029d9:	89 c7                	mov    %eax,%edi
801029db:	58                   	pop    %eax
801029dc:	5a                   	pop    %edx
801029dd:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
801029e4:	ff 35 c4 26 11 80    	pushl  0x801126c4
801029ea:	83 c3 01             	add    $0x1,%ebx
801029ed:	e8 de d6 ff ff       	call   801000d0 <bread>
801029f2:	89 c6                	mov    %eax,%esi
801029f4:	8d 47 5c             	lea    0x5c(%edi),%eax
801029f7:	83 c4 0c             	add    $0xc,%esp
801029fa:	68 00 02 00 00       	push   $0x200
801029ff:	50                   	push   %eax
80102a00:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a03:	50                   	push   %eax
80102a04:	e8 17 1b 00 00       	call   80104520 <memmove>
80102a09:	89 34 24             	mov    %esi,(%esp)
80102a0c:	e8 8f d7 ff ff       	call   801001a0 <bwrite>
80102a11:	89 3c 24             	mov    %edi,(%esp)
80102a14:	e8 c7 d7 ff ff       	call   801001e0 <brelse>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 bf d7 ff ff       	call   801001e0 <brelse>
80102a21:	83 c4 10             	add    $0x10,%esp
80102a24:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a2a:	7f 94                	jg     801029c0 <install_trans+0x20>
80102a2c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a2f:	5b                   	pop    %ebx
80102a30:	5e                   	pop    %esi
80102a31:	5f                   	pop    %edi
80102a32:	5d                   	pop    %ebp
80102a33:	f3 c3                	repz ret 
80102a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a40 <write_head>:
80102a40:	55                   	push   %ebp
80102a41:	89 e5                	mov    %esp,%ebp
80102a43:	53                   	push   %ebx
80102a44:	83 ec 0c             	sub    $0xc,%esp
80102a47:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102a4d:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a53:	e8 78 d6 ff ff       	call   801000d0 <bread>
80102a58:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a5e:	83 c4 10             	add    $0x10,%esp
80102a61:	89 c3                	mov    %eax,%ebx
80102a63:	85 c9                	test   %ecx,%ecx
80102a65:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a68:	7e 1f                	jle    80102a89 <write_head+0x49>
80102a6a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a71:	31 d2                	xor    %edx,%edx
80102a73:	90                   	nop
80102a74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a78:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102a7e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a82:	83 c2 04             	add    $0x4,%edx
80102a85:	39 c2                	cmp    %eax,%edx
80102a87:	75 ef                	jne    80102a78 <write_head+0x38>
80102a89:	83 ec 0c             	sub    $0xc,%esp
80102a8c:	53                   	push   %ebx
80102a8d:	e8 0e d7 ff ff       	call   801001a0 <bwrite>
80102a92:	89 1c 24             	mov    %ebx,(%esp)
80102a95:	e8 46 d7 ff ff       	call   801001e0 <brelse>
80102a9a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102a9d:	c9                   	leave  
80102a9e:	c3                   	ret    
80102a9f:	90                   	nop

80102aa0 <initlog>:
80102aa0:	55                   	push   %ebp
80102aa1:	89 e5                	mov    %esp,%ebp
80102aa3:	53                   	push   %ebx
80102aa4:	83 ec 2c             	sub    $0x2c,%esp
80102aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aaa:	68 e0 73 10 80       	push   $0x801073e0
80102aaf:	68 80 26 11 80       	push   $0x80112680
80102ab4:	e8 57 17 00 00       	call   80104210 <initlock>
80102ab9:	58                   	pop    %eax
80102aba:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102abd:	5a                   	pop    %edx
80102abe:	50                   	push   %eax
80102abf:	53                   	push   %ebx
80102ac0:	e8 5b e9 ff ff       	call   80101420 <readsb>
80102ac5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ac8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102acb:	59                   	pop    %ecx
80102acc:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102ad2:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102ad8:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102add:	5a                   	pop    %edx
80102ade:	50                   	push   %eax
80102adf:	53                   	push   %ebx
80102ae0:	e8 eb d5 ff ff       	call   801000d0 <bread>
80102ae5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102ae8:	83 c4 10             	add    $0x10,%esp
80102aeb:	85 c9                	test   %ecx,%ecx
80102aed:	89 0d c8 26 11 80    	mov    %ecx,0x801126c8
80102af3:	7e 1c                	jle    80102b11 <initlog+0x71>
80102af5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102afc:	31 d2                	xor    %edx,%edx
80102afe:	66 90                	xchg   %ax,%ax
80102b00:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b04:	83 c2 04             	add    $0x4,%edx
80102b07:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102b0d:	39 da                	cmp    %ebx,%edx
80102b0f:	75 ef                	jne    80102b00 <initlog+0x60>
80102b11:	83 ec 0c             	sub    $0xc,%esp
80102b14:	50                   	push   %eax
80102b15:	e8 c6 d6 ff ff       	call   801001e0 <brelse>
80102b1a:	e8 81 fe ff ff       	call   801029a0 <install_trans>
80102b1f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b26:	00 00 00 
80102b29:	e8 12 ff ff ff       	call   80102a40 <write_head>
80102b2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b31:	c9                   	leave  
80102b32:	c3                   	ret    
80102b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b40 <begin_op>:
80102b40:	55                   	push   %ebp
80102b41:	89 e5                	mov    %esp,%ebp
80102b43:	83 ec 14             	sub    $0x14,%esp
80102b46:	68 80 26 11 80       	push   $0x80112680
80102b4b:	e8 20 18 00 00       	call   80104370 <acquire>
80102b50:	83 c4 10             	add    $0x10,%esp
80102b53:	eb 18                	jmp    80102b6d <begin_op+0x2d>
80102b55:	8d 76 00             	lea    0x0(%esi),%esi
80102b58:	83 ec 08             	sub    $0x8,%esp
80102b5b:	68 80 26 11 80       	push   $0x80112680
80102b60:	68 80 26 11 80       	push   $0x80112680
80102b65:	e8 c6 11 00 00       	call   80103d30 <sleep>
80102b6a:	83 c4 10             	add    $0x10,%esp
80102b6d:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102b72:	85 c0                	test   %eax,%eax
80102b74:	75 e2                	jne    80102b58 <begin_op+0x18>
80102b76:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102b7b:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102b81:	83 c0 01             	add    $0x1,%eax
80102b84:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b87:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b8a:	83 fa 1e             	cmp    $0x1e,%edx
80102b8d:	7f c9                	jg     80102b58 <begin_op+0x18>
80102b8f:	83 ec 0c             	sub    $0xc,%esp
80102b92:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102b97:	68 80 26 11 80       	push   $0x80112680
80102b9c:	e8 7f 18 00 00       	call   80104420 <release>
80102ba1:	83 c4 10             	add    $0x10,%esp
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <end_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	57                   	push   %edi
80102bb4:	56                   	push   %esi
80102bb5:	53                   	push   %ebx
80102bb6:	83 ec 18             	sub    $0x18,%esp
80102bb9:	68 80 26 11 80       	push   $0x80112680
80102bbe:	e8 ad 17 00 00       	call   80104370 <acquire>
80102bc3:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102bc8:	8b 1d c0 26 11 80    	mov    0x801126c0,%ebx
80102bce:	83 c4 10             	add    $0x10,%esp
80102bd1:	83 e8 01             	sub    $0x1,%eax
80102bd4:	85 db                	test   %ebx,%ebx
80102bd6:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102bdb:	0f 85 23 01 00 00    	jne    80102d04 <end_op+0x154>
80102be1:	85 c0                	test   %eax,%eax
80102be3:	0f 85 f7 00 00 00    	jne    80102ce0 <end_op+0x130>
80102be9:	83 ec 0c             	sub    $0xc,%esp
80102bec:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102bf3:	00 00 00 
80102bf6:	31 db                	xor    %ebx,%ebx
80102bf8:	68 80 26 11 80       	push   $0x80112680
80102bfd:	e8 1e 18 00 00       	call   80104420 <release>
80102c02:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c08:	83 c4 10             	add    $0x10,%esp
80102c0b:	85 c9                	test   %ecx,%ecx
80102c0d:	0f 8e 8a 00 00 00    	jle    80102c9d <end_op+0xed>
80102c13:	90                   	nop
80102c14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c18:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c1d:	83 ec 08             	sub    $0x8,%esp
80102c20:	01 d8                	add    %ebx,%eax
80102c22:	83 c0 01             	add    $0x1,%eax
80102c25:	50                   	push   %eax
80102c26:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c2c:	e8 9f d4 ff ff       	call   801000d0 <bread>
80102c31:	89 c6                	mov    %eax,%esi
80102c33:	58                   	pop    %eax
80102c34:	5a                   	pop    %edx
80102c35:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102c3c:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c42:	83 c3 01             	add    $0x1,%ebx
80102c45:	e8 86 d4 ff ff       	call   801000d0 <bread>
80102c4a:	89 c7                	mov    %eax,%edi
80102c4c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c4f:	83 c4 0c             	add    $0xc,%esp
80102c52:	68 00 02 00 00       	push   $0x200
80102c57:	50                   	push   %eax
80102c58:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c5b:	50                   	push   %eax
80102c5c:	e8 bf 18 00 00       	call   80104520 <memmove>
80102c61:	89 34 24             	mov    %esi,(%esp)
80102c64:	e8 37 d5 ff ff       	call   801001a0 <bwrite>
80102c69:	89 3c 24             	mov    %edi,(%esp)
80102c6c:	e8 6f d5 ff ff       	call   801001e0 <brelse>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 67 d5 ff ff       	call   801001e0 <brelse>
80102c79:	83 c4 10             	add    $0x10,%esp
80102c7c:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102c82:	7c 94                	jl     80102c18 <end_op+0x68>
80102c84:	e8 b7 fd ff ff       	call   80102a40 <write_head>
80102c89:	e8 12 fd ff ff       	call   801029a0 <install_trans>
80102c8e:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102c95:	00 00 00 
80102c98:	e8 a3 fd ff ff       	call   80102a40 <write_head>
80102c9d:	83 ec 0c             	sub    $0xc,%esp
80102ca0:	68 80 26 11 80       	push   $0x80112680
80102ca5:	e8 c6 16 00 00       	call   80104370 <acquire>
80102caa:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cb1:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102cb8:	00 00 00 
80102cbb:	e8 20 12 00 00       	call   80103ee0 <wakeup>
80102cc0:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cc7:	e8 54 17 00 00       	call   80104420 <release>
80102ccc:	83 c4 10             	add    $0x10,%esp
80102ccf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cd2:	5b                   	pop    %ebx
80102cd3:	5e                   	pop    %esi
80102cd4:	5f                   	pop    %edi
80102cd5:	5d                   	pop    %ebp
80102cd6:	c3                   	ret    
80102cd7:	89 f6                	mov    %esi,%esi
80102cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102ce0:	83 ec 0c             	sub    $0xc,%esp
80102ce3:	68 80 26 11 80       	push   $0x80112680
80102ce8:	e8 f3 11 00 00       	call   80103ee0 <wakeup>
80102ced:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102cf4:	e8 27 17 00 00       	call   80104420 <release>
80102cf9:	83 c4 10             	add    $0x10,%esp
80102cfc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102cff:	5b                   	pop    %ebx
80102d00:	5e                   	pop    %esi
80102d01:	5f                   	pop    %edi
80102d02:	5d                   	pop    %ebp
80102d03:	c3                   	ret    
80102d04:	83 ec 0c             	sub    $0xc,%esp
80102d07:	68 e4 73 10 80       	push   $0x801073e4
80102d0c:	e8 5f d6 ff ff       	call   80100370 <panic>
80102d11:	eb 0d                	jmp    80102d20 <log_write>
80102d13:	90                   	nop
80102d14:	90                   	nop
80102d15:	90                   	nop
80102d16:	90                   	nop
80102d17:	90                   	nop
80102d18:	90                   	nop
80102d19:	90                   	nop
80102d1a:	90                   	nop
80102d1b:	90                   	nop
80102d1c:	90                   	nop
80102d1d:	90                   	nop
80102d1e:	90                   	nop
80102d1f:	90                   	nop

80102d20 <log_write>:
80102d20:	55                   	push   %ebp
80102d21:	89 e5                	mov    %esp,%ebp
80102d23:	53                   	push   %ebx
80102d24:	83 ec 04             	sub    $0x4,%esp
80102d27:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d2d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d30:	83 fa 1d             	cmp    $0x1d,%edx
80102d33:	0f 8f 97 00 00 00    	jg     80102dd0 <log_write+0xb0>
80102d39:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d3e:	83 e8 01             	sub    $0x1,%eax
80102d41:	39 c2                	cmp    %eax,%edx
80102d43:	0f 8d 87 00 00 00    	jge    80102dd0 <log_write+0xb0>
80102d49:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d4e:	85 c0                	test   %eax,%eax
80102d50:	0f 8e 87 00 00 00    	jle    80102ddd <log_write+0xbd>
80102d56:	83 ec 0c             	sub    $0xc,%esp
80102d59:	68 80 26 11 80       	push   $0x80112680
80102d5e:	e8 0d 16 00 00       	call   80104370 <acquire>
80102d63:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d69:	83 c4 10             	add    $0x10,%esp
80102d6c:	83 fa 00             	cmp    $0x0,%edx
80102d6f:	7e 50                	jle    80102dc1 <log_write+0xa1>
80102d71:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d74:	31 c0                	xor    %eax,%eax
80102d76:	3b 0d cc 26 11 80    	cmp    0x801126cc,%ecx
80102d7c:	75 0b                	jne    80102d89 <log_write+0x69>
80102d7e:	eb 38                	jmp    80102db8 <log_write+0x98>
80102d80:	39 0c 85 cc 26 11 80 	cmp    %ecx,-0x7feed934(,%eax,4)
80102d87:	74 2f                	je     80102db8 <log_write+0x98>
80102d89:	83 c0 01             	add    $0x1,%eax
80102d8c:	39 d0                	cmp    %edx,%eax
80102d8e:	75 f0                	jne    80102d80 <log_write+0x60>
80102d90:	89 0c 95 cc 26 11 80 	mov    %ecx,-0x7feed934(,%edx,4)
80102d97:	83 c2 01             	add    $0x1,%edx
80102d9a:	89 15 c8 26 11 80    	mov    %edx,0x801126c8
80102da0:	83 0b 04             	orl    $0x4,(%ebx)
80102da3:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102daa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dad:	c9                   	leave  
80102dae:	e9 6d 16 00 00       	jmp    80104420 <release>
80102db3:	90                   	nop
80102db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102db8:	89 0c 85 cc 26 11 80 	mov    %ecx,-0x7feed934(,%eax,4)
80102dbf:	eb df                	jmp    80102da0 <log_write+0x80>
80102dc1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dc4:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102dc9:	75 d5                	jne    80102da0 <log_write+0x80>
80102dcb:	eb ca                	jmp    80102d97 <log_write+0x77>
80102dcd:	8d 76 00             	lea    0x0(%esi),%esi
80102dd0:	83 ec 0c             	sub    $0xc,%esp
80102dd3:	68 f3 73 10 80       	push   $0x801073f3
80102dd8:	e8 93 d5 ff ff       	call   80100370 <panic>
80102ddd:	83 ec 0c             	sub    $0xc,%esp
80102de0:	68 09 74 10 80       	push   $0x80107409
80102de5:	e8 86 d5 ff ff       	call   80100370 <panic>
80102dea:	66 90                	xchg   %ax,%ax
80102dec:	66 90                	xchg   %ax,%ax
80102dee:	66 90                	xchg   %ax,%ax

80102df0 <mpmain>:
80102df0:	55                   	push   %ebp
80102df1:	89 e5                	mov    %esp,%ebp
80102df3:	53                   	push   %ebx
80102df4:	83 ec 04             	sub    $0x4,%esp
80102df7:	e8 54 09 00 00       	call   80103750 <cpuid>
80102dfc:	89 c3                	mov    %eax,%ebx
80102dfe:	e8 4d 09 00 00       	call   80103750 <cpuid>
80102e03:	83 ec 04             	sub    $0x4,%esp
80102e06:	53                   	push   %ebx
80102e07:	50                   	push   %eax
80102e08:	68 24 74 10 80       	push   $0x80107424
80102e0d:	e8 4e d8 ff ff       	call   80100660 <cprintf>
80102e12:	e8 29 29 00 00       	call   80105740 <idtinit>
80102e17:	e8 b4 08 00 00       	call   801036d0 <mycpu>
80102e1c:	89 c2                	mov    %eax,%edx
80102e1e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e23:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e2a:	e8 01 0c 00 00       	call   80103a30 <scheduler>
80102e2f:	90                   	nop

80102e30 <mpenter>:
80102e30:	55                   	push   %ebp
80102e31:	89 e5                	mov    %esp,%ebp
80102e33:	83 ec 08             	sub    $0x8,%esp
80102e36:	e8 25 3a 00 00       	call   80106860 <switchkvm>
80102e3b:	e8 20 39 00 00       	call   80106760 <seginit>
80102e40:	e8 9b f7 ff ff       	call   801025e0 <lapicinit>
80102e45:	e8 a6 ff ff ff       	call   80102df0 <mpmain>
80102e4a:	66 90                	xchg   %ax,%ax
80102e4c:	66 90                	xchg   %ax,%ax
80102e4e:	66 90                	xchg   %ax,%ax

80102e50 <main>:
80102e50:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e54:	83 e4 f0             	and    $0xfffffff0,%esp
80102e57:	ff 71 fc             	pushl  -0x4(%ecx)
80102e5a:	55                   	push   %ebp
80102e5b:	89 e5                	mov    %esp,%ebp
80102e5d:	53                   	push   %ebx
80102e5e:	51                   	push   %ecx
80102e5f:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102e64:	83 ec 08             	sub    $0x8,%esp
80102e67:	68 00 00 40 80       	push   $0x80400000
80102e6c:	68 a8 55 11 80       	push   $0x801155a8
80102e71:	e8 3a f5 ff ff       	call   801023b0 <kinit1>
80102e76:	e8 85 3e 00 00       	call   80106d00 <kvmalloc>
80102e7b:	e8 70 01 00 00       	call   80102ff0 <mpinit>
80102e80:	e8 5b f7 ff ff       	call   801025e0 <lapicinit>
80102e85:	e8 d6 38 00 00       	call   80106760 <seginit>
80102e8a:	e8 31 03 00 00       	call   801031c0 <picinit>
80102e8f:	e8 4c f3 ff ff       	call   801021e0 <ioapicinit>
80102e94:	e8 07 db ff ff       	call   801009a0 <consoleinit>
80102e99:	e8 92 2b 00 00       	call   80105a30 <uartinit>
80102e9e:	e8 0d 08 00 00       	call   801036b0 <pinit>
80102ea3:	e8 f8 27 00 00       	call   801056a0 <tvinit>
80102ea8:	e8 93 d1 ff ff       	call   80100040 <binit>
80102ead:	e8 9e de ff ff       	call   80100d50 <fileinit>
80102eb2:	e8 09 f1 ff ff       	call   80101fc0 <ideinit>
80102eb7:	83 c4 0c             	add    $0xc,%esp
80102eba:	68 8a 00 00 00       	push   $0x8a
80102ebf:	68 8c a4 10 80       	push   $0x8010a48c
80102ec4:	68 00 70 00 80       	push   $0x80007000
80102ec9:	e8 52 16 00 00       	call   80104520 <memmove>
80102ece:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102ed5:	00 00 00 
80102ed8:	83 c4 10             	add    $0x10,%esp
80102edb:	05 80 27 11 80       	add    $0x80112780,%eax
80102ee0:	39 d8                	cmp    %ebx,%eax
80102ee2:	76 6f                	jbe    80102f53 <main+0x103>
80102ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ee8:	e8 e3 07 00 00       	call   801036d0 <mycpu>
80102eed:	39 d8                	cmp    %ebx,%eax
80102eef:	74 49                	je     80102f3a <main+0xea>
80102ef1:	e8 8a f5 ff ff       	call   80102480 <kalloc>
80102ef6:	05 00 10 00 00       	add    $0x1000,%eax
80102efb:	c7 05 f8 6f 00 80 30 	movl   $0x80102e30,0x80006ff8
80102f02:	2e 10 80 
80102f05:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f0c:	90 10 00 
80102f0f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f14:	0f b6 03             	movzbl (%ebx),%eax
80102f17:	83 ec 08             	sub    $0x8,%esp
80102f1a:	68 00 70 00 00       	push   $0x7000
80102f1f:	50                   	push   %eax
80102f20:	e8 0b f8 ff ff       	call   80102730 <lapicstartap>
80102f25:	83 c4 10             	add    $0x10,%esp
80102f28:	90                   	nop
80102f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f30:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f36:	85 c0                	test   %eax,%eax
80102f38:	74 f6                	je     80102f30 <main+0xe0>
80102f3a:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80102f41:	00 00 00 
80102f44:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f4a:	05 80 27 11 80       	add    $0x80112780,%eax
80102f4f:	39 c3                	cmp    %eax,%ebx
80102f51:	72 95                	jb     80102ee8 <main+0x98>
80102f53:	83 ec 08             	sub    $0x8,%esp
80102f56:	68 00 00 00 8e       	push   $0x8e000000
80102f5b:	68 00 00 40 80       	push   $0x80400000
80102f60:	e8 bb f4 ff ff       	call   80102420 <kinit2>
80102f65:	e8 36 08 00 00       	call   801037a0 <userinit>
80102f6a:	e8 81 fe ff ff       	call   80102df0 <mpmain>
80102f6f:	90                   	nop

80102f70 <mpsearch1>:
80102f70:	55                   	push   %ebp
80102f71:	89 e5                	mov    %esp,%ebp
80102f73:	57                   	push   %edi
80102f74:	56                   	push   %esi
80102f75:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102f7b:	53                   	push   %ebx
80102f7c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102f7f:	83 ec 0c             	sub    $0xc,%esp
80102f82:	39 de                	cmp    %ebx,%esi
80102f84:	73 48                	jae    80102fce <mpsearch1+0x5e>
80102f86:	8d 76 00             	lea    0x0(%esi),%esi
80102f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f90:	83 ec 04             	sub    $0x4,%esp
80102f93:	8d 7e 10             	lea    0x10(%esi),%edi
80102f96:	6a 04                	push   $0x4
80102f98:	68 38 74 10 80       	push   $0x80107438
80102f9d:	56                   	push   %esi
80102f9e:	e8 1d 15 00 00       	call   801044c0 <memcmp>
80102fa3:	83 c4 10             	add    $0x10,%esp
80102fa6:	85 c0                	test   %eax,%eax
80102fa8:	75 1e                	jne    80102fc8 <mpsearch1+0x58>
80102faa:	8d 7e 10             	lea    0x10(%esi),%edi
80102fad:	89 f2                	mov    %esi,%edx
80102faf:	31 c9                	xor    %ecx,%ecx
80102fb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fb8:	0f b6 02             	movzbl (%edx),%eax
80102fbb:	83 c2 01             	add    $0x1,%edx
80102fbe:	01 c1                	add    %eax,%ecx
80102fc0:	39 fa                	cmp    %edi,%edx
80102fc2:	75 f4                	jne    80102fb8 <mpsearch1+0x48>
80102fc4:	84 c9                	test   %cl,%cl
80102fc6:	74 10                	je     80102fd8 <mpsearch1+0x68>
80102fc8:	39 fb                	cmp    %edi,%ebx
80102fca:	89 fe                	mov    %edi,%esi
80102fcc:	77 c2                	ja     80102f90 <mpsearch1+0x20>
80102fce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fd1:	31 c0                	xor    %eax,%eax
80102fd3:	5b                   	pop    %ebx
80102fd4:	5e                   	pop    %esi
80102fd5:	5f                   	pop    %edi
80102fd6:	5d                   	pop    %ebp
80102fd7:	c3                   	ret    
80102fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102fdb:	89 f0                	mov    %esi,%eax
80102fdd:	5b                   	pop    %ebx
80102fde:	5e                   	pop    %esi
80102fdf:	5f                   	pop    %edi
80102fe0:	5d                   	pop    %ebp
80102fe1:	c3                   	ret    
80102fe2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ff0 <mpinit>:
80102ff0:	55                   	push   %ebp
80102ff1:	89 e5                	mov    %esp,%ebp
80102ff3:	57                   	push   %edi
80102ff4:	56                   	push   %esi
80102ff5:	53                   	push   %ebx
80102ff6:	83 ec 1c             	sub    $0x1c,%esp
80102ff9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103000:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103007:	c1 e0 08             	shl    $0x8,%eax
8010300a:	09 d0                	or     %edx,%eax
8010300c:	c1 e0 04             	shl    $0x4,%eax
8010300f:	85 c0                	test   %eax,%eax
80103011:	75 1b                	jne    8010302e <mpinit+0x3e>
80103013:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010301a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103021:	c1 e0 08             	shl    $0x8,%eax
80103024:	09 d0                	or     %edx,%eax
80103026:	c1 e0 0a             	shl    $0xa,%eax
80103029:	2d 00 04 00 00       	sub    $0x400,%eax
8010302e:	ba 00 04 00 00       	mov    $0x400,%edx
80103033:	e8 38 ff ff ff       	call   80102f70 <mpsearch1>
80103038:	85 c0                	test   %eax,%eax
8010303a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010303d:	0f 84 37 01 00 00    	je     8010317a <mpinit+0x18a>
80103043:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103046:	8b 58 04             	mov    0x4(%eax),%ebx
80103049:	85 db                	test   %ebx,%ebx
8010304b:	0f 84 43 01 00 00    	je     80103194 <mpinit+0x1a4>
80103051:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
80103057:	83 ec 04             	sub    $0x4,%esp
8010305a:	6a 04                	push   $0x4
8010305c:	68 3d 74 10 80       	push   $0x8010743d
80103061:	56                   	push   %esi
80103062:	e8 59 14 00 00       	call   801044c0 <memcmp>
80103067:	83 c4 10             	add    $0x10,%esp
8010306a:	85 c0                	test   %eax,%eax
8010306c:	0f 85 22 01 00 00    	jne    80103194 <mpinit+0x1a4>
80103072:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103079:	3c 01                	cmp    $0x1,%al
8010307b:	74 08                	je     80103085 <mpinit+0x95>
8010307d:	3c 04                	cmp    $0x4,%al
8010307f:	0f 85 0f 01 00 00    	jne    80103194 <mpinit+0x1a4>
80103085:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
8010308c:	85 ff                	test   %edi,%edi
8010308e:	74 21                	je     801030b1 <mpinit+0xc1>
80103090:	31 d2                	xor    %edx,%edx
80103092:	31 c0                	xor    %eax,%eax
80103094:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103098:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010309f:	80 
801030a0:	83 c0 01             	add    $0x1,%eax
801030a3:	01 ca                	add    %ecx,%edx
801030a5:	39 c7                	cmp    %eax,%edi
801030a7:	75 ef                	jne    80103098 <mpinit+0xa8>
801030a9:	84 d2                	test   %dl,%dl
801030ab:	0f 85 e3 00 00 00    	jne    80103194 <mpinit+0x1a4>
801030b1:	85 f6                	test   %esi,%esi
801030b3:	0f 84 db 00 00 00    	je     80103194 <mpinit+0x1a4>
801030b9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030bf:	a3 7c 26 11 80       	mov    %eax,0x8011267c
801030c4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030cb:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801030d1:	bb 01 00 00 00       	mov    $0x1,%ebx
801030d6:	01 d6                	add    %edx,%esi
801030d8:	90                   	nop
801030d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030e0:	39 c6                	cmp    %eax,%esi
801030e2:	76 23                	jbe    80103107 <mpinit+0x117>
801030e4:	0f b6 10             	movzbl (%eax),%edx
801030e7:	80 fa 04             	cmp    $0x4,%dl
801030ea:	0f 87 c0 00 00 00    	ja     801031b0 <mpinit+0x1c0>
801030f0:	ff 24 95 7c 74 10 80 	jmp    *-0x7fef8b84(,%edx,4)
801030f7:	89 f6                	mov    %esi,%esi
801030f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103100:	83 c0 08             	add    $0x8,%eax
80103103:	39 c6                	cmp    %eax,%esi
80103105:	77 dd                	ja     801030e4 <mpinit+0xf4>
80103107:	85 db                	test   %ebx,%ebx
80103109:	0f 84 92 00 00 00    	je     801031a1 <mpinit+0x1b1>
8010310f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103112:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103116:	74 15                	je     8010312d <mpinit+0x13d>
80103118:	ba 22 00 00 00       	mov    $0x22,%edx
8010311d:	b8 70 00 00 00       	mov    $0x70,%eax
80103122:	ee                   	out    %al,(%dx)
80103123:	ba 23 00 00 00       	mov    $0x23,%edx
80103128:	ec                   	in     (%dx),%al
80103129:	83 c8 01             	or     $0x1,%eax
8010312c:	ee                   	out    %al,(%dx)
8010312d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103130:	5b                   	pop    %ebx
80103131:	5e                   	pop    %esi
80103132:	5f                   	pop    %edi
80103133:	5d                   	pop    %ebp
80103134:	c3                   	ret    
80103135:	8d 76 00             	lea    0x0(%esi),%esi
80103138:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
8010313e:	83 f9 07             	cmp    $0x7,%ecx
80103141:	7f 19                	jg     8010315c <mpinit+0x16c>
80103143:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103147:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010314d:	83 c1 01             	add    $0x1,%ecx
80103150:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
80103156:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
8010315c:	83 c0 14             	add    $0x14,%eax
8010315f:	e9 7c ff ff ff       	jmp    801030e0 <mpinit+0xf0>
80103164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
8010316c:	83 c0 08             	add    $0x8,%eax
8010316f:	88 15 60 27 11 80    	mov    %dl,0x80112760
80103175:	e9 66 ff ff ff       	jmp    801030e0 <mpinit+0xf0>
8010317a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010317f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103184:	e8 e7 fd ff ff       	call   80102f70 <mpsearch1>
80103189:	85 c0                	test   %eax,%eax
8010318b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010318e:	0f 85 af fe ff ff    	jne    80103043 <mpinit+0x53>
80103194:	83 ec 0c             	sub    $0xc,%esp
80103197:	68 42 74 10 80       	push   $0x80107442
8010319c:	e8 cf d1 ff ff       	call   80100370 <panic>
801031a1:	83 ec 0c             	sub    $0xc,%esp
801031a4:	68 5c 74 10 80       	push   $0x8010745c
801031a9:	e8 c2 d1 ff ff       	call   80100370 <panic>
801031ae:	66 90                	xchg   %ax,%ax
801031b0:	31 db                	xor    %ebx,%ebx
801031b2:	e9 30 ff ff ff       	jmp    801030e7 <mpinit+0xf7>
801031b7:	66 90                	xchg   %ax,%ax
801031b9:	66 90                	xchg   %ax,%ax
801031bb:	66 90                	xchg   %ax,%ax
801031bd:	66 90                	xchg   %ax,%ax
801031bf:	90                   	nop

801031c0 <picinit>:
801031c0:	55                   	push   %ebp
801031c1:	ba 21 00 00 00       	mov    $0x21,%edx
801031c6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031cb:	89 e5                	mov    %esp,%ebp
801031cd:	ee                   	out    %al,(%dx)
801031ce:	ba a1 00 00 00       	mov    $0xa1,%edx
801031d3:	ee                   	out    %al,(%dx)
801031d4:	5d                   	pop    %ebp
801031d5:	c3                   	ret    
801031d6:	66 90                	xchg   %ax,%ax
801031d8:	66 90                	xchg   %ax,%ax
801031da:	66 90                	xchg   %ax,%ax
801031dc:	66 90                	xchg   %ax,%ax
801031de:	66 90                	xchg   %ax,%ax

801031e0 <pipealloc>:
801031e0:	55                   	push   %ebp
801031e1:	89 e5                	mov    %esp,%ebp
801031e3:	57                   	push   %edi
801031e4:	56                   	push   %esi
801031e5:	53                   	push   %ebx
801031e6:	83 ec 0c             	sub    $0xc,%esp
801031e9:	8b 75 08             	mov    0x8(%ebp),%esi
801031ec:	8b 5d 0c             	mov    0xc(%ebp),%ebx
801031ef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801031f5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
801031fb:	e8 70 db ff ff       	call   80100d70 <filealloc>
80103200:	85 c0                	test   %eax,%eax
80103202:	89 06                	mov    %eax,(%esi)
80103204:	0f 84 a8 00 00 00    	je     801032b2 <pipealloc+0xd2>
8010320a:	e8 61 db ff ff       	call   80100d70 <filealloc>
8010320f:	85 c0                	test   %eax,%eax
80103211:	89 03                	mov    %eax,(%ebx)
80103213:	0f 84 87 00 00 00    	je     801032a0 <pipealloc+0xc0>
80103219:	e8 62 f2 ff ff       	call   80102480 <kalloc>
8010321e:	85 c0                	test   %eax,%eax
80103220:	89 c7                	mov    %eax,%edi
80103222:	0f 84 b0 00 00 00    	je     801032d8 <pipealloc+0xf8>
80103228:	83 ec 08             	sub    $0x8,%esp
8010322b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103232:	00 00 00 
80103235:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010323c:	00 00 00 
8010323f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103246:	00 00 00 
80103249:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103250:	00 00 00 
80103253:	68 90 74 10 80       	push   $0x80107490
80103258:	50                   	push   %eax
80103259:	e8 b2 0f 00 00       	call   80104210 <initlock>
8010325e:	8b 06                	mov    (%esi),%eax
80103260:	83 c4 10             	add    $0x10,%esp
80103263:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103269:	8b 06                	mov    (%esi),%eax
8010326b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
8010326f:	8b 06                	mov    (%esi),%eax
80103271:	c6 40 09 00          	movb   $0x0,0x9(%eax)
80103275:	8b 06                	mov    (%esi),%eax
80103277:	89 78 0c             	mov    %edi,0xc(%eax)
8010327a:	8b 03                	mov    (%ebx),%eax
8010327c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103282:	8b 03                	mov    (%ebx),%eax
80103284:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103288:	8b 03                	mov    (%ebx),%eax
8010328a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
8010328e:	8b 03                	mov    (%ebx),%eax
80103290:	89 78 0c             	mov    %edi,0xc(%eax)
80103293:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103296:	31 c0                	xor    %eax,%eax
80103298:	5b                   	pop    %ebx
80103299:	5e                   	pop    %esi
8010329a:	5f                   	pop    %edi
8010329b:	5d                   	pop    %ebp
8010329c:	c3                   	ret    
8010329d:	8d 76 00             	lea    0x0(%esi),%esi
801032a0:	8b 06                	mov    (%esi),%eax
801032a2:	85 c0                	test   %eax,%eax
801032a4:	74 1e                	je     801032c4 <pipealloc+0xe4>
801032a6:	83 ec 0c             	sub    $0xc,%esp
801032a9:	50                   	push   %eax
801032aa:	e8 81 db ff ff       	call   80100e30 <fileclose>
801032af:	83 c4 10             	add    $0x10,%esp
801032b2:	8b 03                	mov    (%ebx),%eax
801032b4:	85 c0                	test   %eax,%eax
801032b6:	74 0c                	je     801032c4 <pipealloc+0xe4>
801032b8:	83 ec 0c             	sub    $0xc,%esp
801032bb:	50                   	push   %eax
801032bc:	e8 6f db ff ff       	call   80100e30 <fileclose>
801032c1:	83 c4 10             	add    $0x10,%esp
801032c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032cc:	5b                   	pop    %ebx
801032cd:	5e                   	pop    %esi
801032ce:	5f                   	pop    %edi
801032cf:	5d                   	pop    %ebp
801032d0:	c3                   	ret    
801032d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801032d8:	8b 06                	mov    (%esi),%eax
801032da:	85 c0                	test   %eax,%eax
801032dc:	75 c8                	jne    801032a6 <pipealloc+0xc6>
801032de:	eb d2                	jmp    801032b2 <pipealloc+0xd2>

801032e0 <pipeclose>:
801032e0:	55                   	push   %ebp
801032e1:	89 e5                	mov    %esp,%ebp
801032e3:	56                   	push   %esi
801032e4:	53                   	push   %ebx
801032e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032e8:	8b 75 0c             	mov    0xc(%ebp),%esi
801032eb:	83 ec 0c             	sub    $0xc,%esp
801032ee:	53                   	push   %ebx
801032ef:	e8 7c 10 00 00       	call   80104370 <acquire>
801032f4:	83 c4 10             	add    $0x10,%esp
801032f7:	85 f6                	test   %esi,%esi
801032f9:	74 45                	je     80103340 <pipeclose+0x60>
801032fb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103301:	83 ec 0c             	sub    $0xc,%esp
80103304:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010330b:	00 00 00 
8010330e:	50                   	push   %eax
8010330f:	e8 cc 0b 00 00       	call   80103ee0 <wakeup>
80103314:	83 c4 10             	add    $0x10,%esp
80103317:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010331d:	85 d2                	test   %edx,%edx
8010331f:	75 0a                	jne    8010332b <pipeclose+0x4b>
80103321:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103327:	85 c0                	test   %eax,%eax
80103329:	74 35                	je     80103360 <pipeclose+0x80>
8010332b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010332e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103331:	5b                   	pop    %ebx
80103332:	5e                   	pop    %esi
80103333:	5d                   	pop    %ebp
80103334:	e9 e7 10 00 00       	jmp    80104420 <release>
80103339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103340:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103346:	83 ec 0c             	sub    $0xc,%esp
80103349:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103350:	00 00 00 
80103353:	50                   	push   %eax
80103354:	e8 87 0b 00 00       	call   80103ee0 <wakeup>
80103359:	83 c4 10             	add    $0x10,%esp
8010335c:	eb b9                	jmp    80103317 <pipeclose+0x37>
8010335e:	66 90                	xchg   %ax,%ax
80103360:	83 ec 0c             	sub    $0xc,%esp
80103363:	53                   	push   %ebx
80103364:	e8 b7 10 00 00       	call   80104420 <release>
80103369:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010336c:	83 c4 10             	add    $0x10,%esp
8010336f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103372:	5b                   	pop    %ebx
80103373:	5e                   	pop    %esi
80103374:	5d                   	pop    %ebp
80103375:	e9 56 ef ff ff       	jmp    801022d0 <kfree>
8010337a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103380 <pipewrite>:
80103380:	55                   	push   %ebp
80103381:	89 e5                	mov    %esp,%ebp
80103383:	57                   	push   %edi
80103384:	56                   	push   %esi
80103385:	53                   	push   %ebx
80103386:	83 ec 28             	sub    $0x28,%esp
80103389:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010338c:	53                   	push   %ebx
8010338d:	e8 de 0f 00 00       	call   80104370 <acquire>
80103392:	8b 45 10             	mov    0x10(%ebp),%eax
80103395:	83 c4 10             	add    $0x10,%esp
80103398:	85 c0                	test   %eax,%eax
8010339a:	0f 8e b9 00 00 00    	jle    80103459 <pipewrite+0xd9>
801033a0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033a3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033a9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033af:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033b5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033b8:	03 4d 10             	add    0x10(%ebp),%ecx
801033bb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801033be:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033c4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033ca:	39 d0                	cmp    %edx,%eax
801033cc:	74 38                	je     80103406 <pipewrite+0x86>
801033ce:	eb 59                	jmp    80103429 <pipewrite+0xa9>
801033d0:	e8 9b 03 00 00       	call   80103770 <myproc>
801033d5:	8b 48 24             	mov    0x24(%eax),%ecx
801033d8:	85 c9                	test   %ecx,%ecx
801033da:	75 34                	jne    80103410 <pipewrite+0x90>
801033dc:	83 ec 0c             	sub    $0xc,%esp
801033df:	57                   	push   %edi
801033e0:	e8 fb 0a 00 00       	call   80103ee0 <wakeup>
801033e5:	58                   	pop    %eax
801033e6:	5a                   	pop    %edx
801033e7:	53                   	push   %ebx
801033e8:	56                   	push   %esi
801033e9:	e8 42 09 00 00       	call   80103d30 <sleep>
801033ee:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801033f4:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
801033fa:	83 c4 10             	add    $0x10,%esp
801033fd:	05 00 02 00 00       	add    $0x200,%eax
80103402:	39 c2                	cmp    %eax,%edx
80103404:	75 2a                	jne    80103430 <pipewrite+0xb0>
80103406:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010340c:	85 c0                	test   %eax,%eax
8010340e:	75 c0                	jne    801033d0 <pipewrite+0x50>
80103410:	83 ec 0c             	sub    $0xc,%esp
80103413:	53                   	push   %ebx
80103414:	e8 07 10 00 00       	call   80104420 <release>
80103419:	83 c4 10             	add    $0x10,%esp
8010341c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103421:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103424:	5b                   	pop    %ebx
80103425:	5e                   	pop    %esi
80103426:	5f                   	pop    %edi
80103427:	5d                   	pop    %ebp
80103428:	c3                   	ret    
80103429:	89 c2                	mov    %eax,%edx
8010342b:	90                   	nop
8010342c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103430:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103433:	8d 42 01             	lea    0x1(%edx),%eax
80103436:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010343a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103440:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103446:	0f b6 09             	movzbl (%ecx),%ecx
80103449:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010344d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103450:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103453:	0f 85 65 ff ff ff    	jne    801033be <pipewrite+0x3e>
80103459:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010345f:	83 ec 0c             	sub    $0xc,%esp
80103462:	50                   	push   %eax
80103463:	e8 78 0a 00 00       	call   80103ee0 <wakeup>
80103468:	89 1c 24             	mov    %ebx,(%esp)
8010346b:	e8 b0 0f 00 00       	call   80104420 <release>
80103470:	83 c4 10             	add    $0x10,%esp
80103473:	8b 45 10             	mov    0x10(%ebp),%eax
80103476:	eb a9                	jmp    80103421 <pipewrite+0xa1>
80103478:	90                   	nop
80103479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103480 <piperead>:
80103480:	55                   	push   %ebp
80103481:	89 e5                	mov    %esp,%ebp
80103483:	57                   	push   %edi
80103484:	56                   	push   %esi
80103485:	53                   	push   %ebx
80103486:	83 ec 18             	sub    $0x18,%esp
80103489:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010348c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010348f:	53                   	push   %ebx
80103490:	e8 db 0e 00 00       	call   80104370 <acquire>
80103495:	83 c4 10             	add    $0x10,%esp
80103498:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010349e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034a4:	75 6a                	jne    80103510 <piperead+0x90>
801034a6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034ac:	85 f6                	test   %esi,%esi
801034ae:	0f 84 cc 00 00 00    	je     80103580 <piperead+0x100>
801034b4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ba:	eb 2d                	jmp    801034e9 <piperead+0x69>
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c0:	83 ec 08             	sub    $0x8,%esp
801034c3:	53                   	push   %ebx
801034c4:	56                   	push   %esi
801034c5:	e8 66 08 00 00       	call   80103d30 <sleep>
801034ca:	83 c4 10             	add    $0x10,%esp
801034cd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034d3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034d9:	75 35                	jne    80103510 <piperead+0x90>
801034db:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034e1:	85 d2                	test   %edx,%edx
801034e3:	0f 84 97 00 00 00    	je     80103580 <piperead+0x100>
801034e9:	e8 82 02 00 00       	call   80103770 <myproc>
801034ee:	8b 48 24             	mov    0x24(%eax),%ecx
801034f1:	85 c9                	test   %ecx,%ecx
801034f3:	74 cb                	je     801034c0 <piperead+0x40>
801034f5:	83 ec 0c             	sub    $0xc,%esp
801034f8:	53                   	push   %ebx
801034f9:	e8 22 0f 00 00       	call   80104420 <release>
801034fe:	83 c4 10             	add    $0x10,%esp
80103501:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103504:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103509:	5b                   	pop    %ebx
8010350a:	5e                   	pop    %esi
8010350b:	5f                   	pop    %edi
8010350c:	5d                   	pop    %ebp
8010350d:	c3                   	ret    
8010350e:	66 90                	xchg   %ax,%ax
80103510:	8b 45 10             	mov    0x10(%ebp),%eax
80103513:	85 c0                	test   %eax,%eax
80103515:	7e 69                	jle    80103580 <piperead+0x100>
80103517:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010351d:	31 c9                	xor    %ecx,%ecx
8010351f:	eb 15                	jmp    80103536 <piperead+0xb6>
80103521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103528:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103534:	74 5a                	je     80103590 <piperead+0x110>
80103536:	8d 70 01             	lea    0x1(%eax),%esi
80103539:	25 ff 01 00 00       	and    $0x1ff,%eax
8010353e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103544:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103549:	88 04 0f             	mov    %al,(%edi,%ecx,1)
8010354c:	83 c1 01             	add    $0x1,%ecx
8010354f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103552:	75 d4                	jne    80103528 <piperead+0xa8>
80103554:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010355a:	83 ec 0c             	sub    $0xc,%esp
8010355d:	50                   	push   %eax
8010355e:	e8 7d 09 00 00       	call   80103ee0 <wakeup>
80103563:	89 1c 24             	mov    %ebx,(%esp)
80103566:	e8 b5 0e 00 00       	call   80104420 <release>
8010356b:	8b 45 10             	mov    0x10(%ebp),%eax
8010356e:	83 c4 10             	add    $0x10,%esp
80103571:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103574:	5b                   	pop    %ebx
80103575:	5e                   	pop    %esi
80103576:	5f                   	pop    %edi
80103577:	5d                   	pop    %ebp
80103578:	c3                   	ret    
80103579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103580:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103587:	eb cb                	jmp    80103554 <piperead+0xd4>
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103590:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103593:	eb bf                	jmp    80103554 <piperead+0xd4>
80103595:	66 90                	xchg   %ax,%ax
80103597:	66 90                	xchg   %ax,%ax
80103599:	66 90                	xchg   %ax,%ax
8010359b:	66 90                	xchg   %ax,%ax
8010359d:	66 90                	xchg   %ax,%ax
8010359f:	90                   	nop

801035a0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035a0:	55                   	push   %ebp
801035a1:	89 e5                	mov    %esp,%ebp
801035a3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035a4:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035a9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035ac:	68 20 2d 11 80       	push   $0x80112d20
801035b1:	e8 ba 0d 00 00       	call   80104370 <acquire>
801035b6:	83 c4 10             	add    $0x10,%esp
801035b9:	eb 10                	jmp    801035cb <allocproc+0x2b>
801035bb:	90                   	nop
801035bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035c0:	83 eb 80             	sub    $0xffffff80,%ebx
801035c3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801035c9:	74 75                	je     80103640 <allocproc+0xa0>
    if(p->state == UNUSED)
801035cb:	8b 43 0c             	mov    0xc(%ebx),%eax
801035ce:	85 c0                	test   %eax,%eax
801035d0:	75 ee                	jne    801035c0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035d2:	a1 04 a0 10 80       	mov    0x8010a004,%eax

  release(&ptable.lock);
801035d7:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801035da:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;

  release(&ptable.lock);
801035e1:	68 20 2d 11 80       	push   $0x80112d20
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035e6:	8d 50 01             	lea    0x1(%eax),%edx
801035e9:	89 43 10             	mov    %eax,0x10(%ebx)
801035ec:	89 15 04 a0 10 80    	mov    %edx,0x8010a004

  release(&ptable.lock);
801035f2:	e8 29 0e 00 00       	call   80104420 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
801035f7:	e8 84 ee ff ff       	call   80102480 <kalloc>
801035fc:	83 c4 10             	add    $0x10,%esp
801035ff:	85 c0                	test   %eax,%eax
80103601:	89 43 08             	mov    %eax,0x8(%ebx)
80103604:	74 51                	je     80103657 <allocproc+0xb7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103606:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010360c:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
8010360f:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103614:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103617:	c7 40 14 91 56 10 80 	movl   $0x80105691,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010361e:	6a 14                	push   $0x14
80103620:	6a 00                	push   $0x0
80103622:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103623:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103626:	e8 45 0e 00 00       	call   80104470 <memset>
  p->context->eip = (uint)forkret;
8010362b:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
8010362e:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103631:	c7 40 10 60 36 10 80 	movl   $0x80103660,0x10(%eax)

  return p;
80103638:	89 d8                	mov    %ebx,%eax
}
8010363a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010363d:	c9                   	leave  
8010363e:	c3                   	ret    
8010363f:	90                   	nop

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103640:	83 ec 0c             	sub    $0xc,%esp
80103643:	68 20 2d 11 80       	push   $0x80112d20
80103648:	e8 d3 0d 00 00       	call   80104420 <release>
  return 0;
8010364d:	83 c4 10             	add    $0x10,%esp
80103650:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
80103652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103655:	c9                   	leave  
80103656:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
80103657:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
8010365e:	eb da                	jmp    8010363a <allocproc+0x9a>

80103660 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103660:	55                   	push   %ebp
80103661:	89 e5                	mov    %esp,%ebp
80103663:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103666:	68 20 2d 11 80       	push   $0x80112d20
8010366b:	e8 b0 0d 00 00       	call   80104420 <release>

  if (first) {
80103670:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103675:	83 c4 10             	add    $0x10,%esp
80103678:	85 c0                	test   %eax,%eax
8010367a:	75 04                	jne    80103680 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010367c:	c9                   	leave  
8010367d:	c3                   	ret    
8010367e:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103680:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103683:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010368a:	00 00 00 
    iinit(ROOTDEV);
8010368d:	6a 01                	push   $0x1
8010368f:	e8 cc dd ff ff       	call   80101460 <iinit>
    initlog(ROOTDEV);
80103694:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010369b:	e8 00 f4 ff ff       	call   80102aa0 <initlog>
801036a0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036a3:	c9                   	leave  
801036a4:	c3                   	ret    
801036a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036b0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801036b0:	55                   	push   %ebp
801036b1:	89 e5                	mov    %esp,%ebp
801036b3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036b6:	68 95 74 10 80       	push   $0x80107495
801036bb:	68 20 2d 11 80       	push   $0x80112d20
801036c0:	e8 4b 0b 00 00       	call   80104210 <initlock>
}
801036c5:	83 c4 10             	add    $0x10,%esp
801036c8:	c9                   	leave  
801036c9:	c3                   	ret    
801036ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801036d0 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
801036d0:	55                   	push   %ebp
801036d1:	89 e5                	mov    %esp,%ebp
801036d3:	56                   	push   %esi
801036d4:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801036d5:	9c                   	pushf  
801036d6:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
801036d7:	f6 c4 02             	test   $0x2,%ah
801036da:	75 5b                	jne    80103737 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
801036dc:	e8 ff ef ff ff       	call   801026e0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801036e1:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
801036e7:	85 f6                	test   %esi,%esi
801036e9:	7e 3f                	jle    8010372a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
801036eb:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
801036f2:	39 d0                	cmp    %edx,%eax
801036f4:	74 30                	je     80103726 <mycpu+0x56>
801036f6:	b9 30 28 11 80       	mov    $0x80112830,%ecx
801036fb:	31 d2                	xor    %edx,%edx
801036fd:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103700:	83 c2 01             	add    $0x1,%edx
80103703:	39 f2                	cmp    %esi,%edx
80103705:	74 23                	je     8010372a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103707:	0f b6 19             	movzbl (%ecx),%ebx
8010370a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103710:	39 d8                	cmp    %ebx,%eax
80103712:	75 ec                	jne    80103700 <mycpu+0x30>
      return &cpus[i];
80103714:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010371a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010371d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010371e:	05 80 27 11 80       	add    $0x80112780,%eax
  }
  panic("unknown apicid\n");
}
80103723:	5e                   	pop    %esi
80103724:	5d                   	pop    %ebp
80103725:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103726:	31 d2                	xor    %edx,%edx
80103728:	eb ea                	jmp    80103714 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010372a:	83 ec 0c             	sub    $0xc,%esp
8010372d:	68 9c 74 10 80       	push   $0x8010749c
80103732:	e8 39 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103737:	83 ec 0c             	sub    $0xc,%esp
8010373a:	68 8c 75 10 80       	push   $0x8010758c
8010373f:	e8 2c cc ff ff       	call   80100370 <panic>
80103744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010374a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103750 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103756:	e8 75 ff ff ff       	call   801036d0 <mycpu>
8010375b:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103760:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103761:	c1 f8 04             	sar    $0x4,%eax
80103764:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010376a:	c3                   	ret    
8010376b:	90                   	nop
8010376c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103770 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
80103770:	55                   	push   %ebp
80103771:	89 e5                	mov    %esp,%ebp
80103773:	53                   	push   %ebx
80103774:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
80103777:	e8 14 0b 00 00       	call   80104290 <pushcli>
  c = mycpu();
8010377c:	e8 4f ff ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103781:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103787:	e8 44 0b 00 00       	call   801042d0 <popcli>
  return p;
}
8010378c:	83 c4 04             	add    $0x4,%esp
8010378f:	89 d8                	mov    %ebx,%eax
80103791:	5b                   	pop    %ebx
80103792:	5d                   	pop    %ebp
80103793:	c3                   	ret    
80103794:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010379a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037a0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037a7:	e8 f4 fd ff ff       	call   801035a0 <allocproc>
801037ac:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037ae:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
801037b3:	e8 c8 34 00 00       	call   80106c80 <setupkvm>
801037b8:	85 c0                	test   %eax,%eax
801037ba:	89 43 04             	mov    %eax,0x4(%ebx)
801037bd:	0f 84 bd 00 00 00    	je     80103880 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037c3:	83 ec 04             	sub    $0x4,%esp
801037c6:	68 2c 00 00 00       	push   $0x2c
801037cb:	68 60 a4 10 80       	push   $0x8010a460
801037d0:	50                   	push   %eax
801037d1:	e8 ba 31 00 00       	call   80106990 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
801037d6:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
801037d9:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
801037df:	6a 4c                	push   $0x4c
801037e1:	6a 00                	push   $0x0
801037e3:	ff 73 18             	pushl  0x18(%ebx)
801037e6:	e8 85 0c 00 00       	call   80104470 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037eb:	8b 43 18             	mov    0x18(%ebx),%eax
801037ee:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037f3:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
801037f8:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801037fb:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801037ff:	8b 43 18             	mov    0x18(%ebx),%eax
80103802:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103806:	8b 43 18             	mov    0x18(%ebx),%eax
80103809:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010380d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103811:	8b 43 18             	mov    0x18(%ebx),%eax
80103814:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103818:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010381c:	8b 43 18             	mov    0x18(%ebx),%eax
8010381f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103826:	8b 43 18             	mov    0x18(%ebx),%eax
80103829:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103830:	8b 43 18             	mov    0x18(%ebx),%eax
80103833:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010383a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010383d:	6a 10                	push   $0x10
8010383f:	68 c5 74 10 80       	push   $0x801074c5
80103844:	50                   	push   %eax
80103845:	e8 26 0e 00 00       	call   80104670 <safestrcpy>
  p->cwd = namei("/");
8010384a:	c7 04 24 ce 74 10 80 	movl   $0x801074ce,(%esp)
80103851:	e8 5a e6 ff ff       	call   80101eb0 <namei>
80103856:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103859:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103860:	e8 0b 0b 00 00       	call   80104370 <acquire>

  p->state = RUNNABLE;
80103865:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010386c:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103873:	e8 a8 0b 00 00       	call   80104420 <release>
}
80103878:	83 c4 10             	add    $0x10,%esp
8010387b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010387e:	c9                   	leave  
8010387f:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103880:	83 ec 0c             	sub    $0xc,%esp
80103883:	68 ac 74 10 80       	push   $0x801074ac
80103888:	e8 e3 ca ff ff       	call   80100370 <panic>
8010388d:	8d 76 00             	lea    0x0(%esi),%esi

80103890 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103890:	55                   	push   %ebp
80103891:	89 e5                	mov    %esp,%ebp
80103893:	56                   	push   %esi
80103894:	53                   	push   %ebx
80103895:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103898:	e8 f3 09 00 00       	call   80104290 <pushcli>
  c = mycpu();
8010389d:	e8 2e fe ff ff       	call   801036d0 <mycpu>
  p = c->proc;
801038a2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038a8:	e8 23 0a 00 00       	call   801042d0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038ad:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038b0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038b2:	7e 34                	jle    801038e8 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038b4:	83 ec 04             	sub    $0x4,%esp
801038b7:	01 c6                	add    %eax,%esi
801038b9:	56                   	push   %esi
801038ba:	50                   	push   %eax
801038bb:	ff 73 04             	pushl  0x4(%ebx)
801038be:	e8 0d 32 00 00       	call   80106ad0 <allocuvm>
801038c3:	83 c4 10             	add    $0x10,%esp
801038c6:	85 c0                	test   %eax,%eax
801038c8:	74 36                	je     80103900 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038ca:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038cd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038cf:	53                   	push   %ebx
801038d0:	e8 ab 2f 00 00       	call   80106880 <switchuvm>
  return 0;
801038d5:	83 c4 10             	add    $0x10,%esp
801038d8:	31 c0                	xor    %eax,%eax
}
801038da:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038dd:	5b                   	pop    %ebx
801038de:	5e                   	pop    %esi
801038df:	5d                   	pop    %ebp
801038e0:	c3                   	ret    
801038e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801038e8:	74 e0                	je     801038ca <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038ea:	83 ec 04             	sub    $0x4,%esp
801038ed:	01 c6                	add    %eax,%esi
801038ef:	56                   	push   %esi
801038f0:	50                   	push   %eax
801038f1:	ff 73 04             	pushl  0x4(%ebx)
801038f4:	e8 d7 32 00 00       	call   80106bd0 <deallocuvm>
801038f9:	83 c4 10             	add    $0x10,%esp
801038fc:	85 c0                	test   %eax,%eax
801038fe:	75 ca                	jne    801038ca <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103900:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103905:	eb d3                	jmp    801038da <growproc+0x4a>
80103907:	89 f6                	mov    %esi,%esi
80103909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103910 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	57                   	push   %edi
80103914:	56                   	push   %esi
80103915:	53                   	push   %ebx
80103916:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103919:	e8 72 09 00 00       	call   80104290 <pushcli>
  c = mycpu();
8010391e:	e8 ad fd ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103923:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103929:	e8 a2 09 00 00       	call   801042d0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010392e:	e8 6d fc ff ff       	call   801035a0 <allocproc>
80103933:	85 c0                	test   %eax,%eax
80103935:	89 c7                	mov    %eax,%edi
80103937:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010393a:	0f 84 b5 00 00 00    	je     801039f5 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103940:	83 ec 08             	sub    $0x8,%esp
80103943:	ff 33                	pushl  (%ebx)
80103945:	ff 73 04             	pushl  0x4(%ebx)
80103948:	e8 03 34 00 00       	call   80106d50 <copyuvm>
8010394d:	83 c4 10             	add    $0x10,%esp
80103950:	85 c0                	test   %eax,%eax
80103952:	89 47 04             	mov    %eax,0x4(%edi)
80103955:	0f 84 a1 00 00 00    	je     801039fc <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010395b:	8b 03                	mov    (%ebx),%eax
8010395d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103960:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103962:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103965:	89 c8                	mov    %ecx,%eax
80103967:	8b 79 18             	mov    0x18(%ecx),%edi
8010396a:	8b 73 18             	mov    0x18(%ebx),%esi
8010396d:	b9 13 00 00 00       	mov    $0x13,%ecx
80103972:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103974:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103976:	8b 40 18             	mov    0x18(%eax),%eax
80103979:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103980:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103984:	85 c0                	test   %eax,%eax
80103986:	74 13                	je     8010399b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103988:	83 ec 0c             	sub    $0xc,%esp
8010398b:	50                   	push   %eax
8010398c:	e8 4f d4 ff ff       	call   80100de0 <filedup>
80103991:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103994:	83 c4 10             	add    $0x10,%esp
80103997:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
8010399b:	83 c6 01             	add    $0x1,%esi
8010399e:	83 fe 10             	cmp    $0x10,%esi
801039a1:	75 dd                	jne    80103980 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039a3:	83 ec 0c             	sub    $0xc,%esp
801039a6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039a9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039ac:	e8 7f dc ff ff       	call   80101630 <idup>
801039b1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039b4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039b7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ba:	8d 47 6c             	lea    0x6c(%edi),%eax
801039bd:	6a 10                	push   $0x10
801039bf:	53                   	push   %ebx
801039c0:	50                   	push   %eax
801039c1:	e8 aa 0c 00 00       	call   80104670 <safestrcpy>

  pid = np->pid;
801039c6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
801039c9:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039d0:	e8 9b 09 00 00       	call   80104370 <acquire>

  np->state = RUNNABLE;
801039d5:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
801039dc:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
801039e3:	e8 38 0a 00 00       	call   80104420 <release>

  return pid;
801039e8:	83 c4 10             	add    $0x10,%esp
801039eb:	89 d8                	mov    %ebx,%eax
}
801039ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801039f0:	5b                   	pop    %ebx
801039f1:	5e                   	pop    %esi
801039f2:	5f                   	pop    %edi
801039f3:	5d                   	pop    %ebp
801039f4:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
801039f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039fa:	eb f1                	jmp    801039ed <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
801039fc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801039ff:	83 ec 0c             	sub    $0xc,%esp
80103a02:	ff 77 08             	pushl  0x8(%edi)
80103a05:	e8 c6 e8 ff ff       	call   801022d0 <kfree>
    np->kstack = 0;
80103a0a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a11:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a18:	83 c4 10             	add    $0x10,%esp
80103a1b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a20:	eb cb                	jmp    801039ed <fork+0xdd>
80103a22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a30 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a30:	55                   	push   %ebp
80103a31:	89 e5                	mov    %esp,%ebp
80103a33:	57                   	push   %edi
80103a34:	56                   	push   %esi
80103a35:	53                   	push   %ebx
80103a36:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a39:	e8 92 fc ff ff       	call   801036d0 <mycpu>
80103a3e:	8d 78 04             	lea    0x4(%eax),%edi
80103a41:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a43:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a4a:	00 00 00 
80103a4d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a50:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a51:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a54:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a59:	68 20 2d 11 80       	push   $0x80112d20
80103a5e:	e8 0d 09 00 00       	call   80104370 <acquire>
80103a63:	83 c4 10             	add    $0x10,%esp
80103a66:	eb 13                	jmp    80103a7b <scheduler+0x4b>
80103a68:	90                   	nop
80103a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a70:	83 eb 80             	sub    $0xffffff80,%ebx
80103a73:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103a79:	74 55                	je     80103ad0 <scheduler+0xa0>
      if(p->state != RUNNABLE)
80103a7b:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103a7f:	75 ef                	jne    80103a70 <scheduler+0x40>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a81:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103a84:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103a8a:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a8b:	83 eb 80             	sub    $0xffffff80,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
80103a8e:	e8 ed 2d 00 00       	call   80106880 <switchuvm>
      p->state = RUNNING;
	p->priority = 10;

      swtch(&(c->scheduler), p->context);
80103a93:	58                   	pop    %eax
80103a94:	5a                   	pop    %edx
80103a95:	ff 73 9c             	pushl  -0x64(%ebx)
80103a98:	57                   	push   %edi
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103a99:	c7 43 8c 04 00 00 00 	movl   $0x4,-0x74(%ebx)
	p->priority = 10;
80103aa0:	c7 43 fc 0a 00 00 00 	movl   $0xa,-0x4(%ebx)

      swtch(&(c->scheduler), p->context);
80103aa7:	e8 1f 0c 00 00       	call   801046cb <swtch>
      switchkvm();
80103aac:	e8 af 2d 00 00       	call   80106860 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103ab1:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ab4:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103aba:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103ac1:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ac4:	75 b5                	jne    80103a7b <scheduler+0x4b>
80103ac6:	8d 76 00             	lea    0x0(%esi),%esi
80103ac9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103ad0:	83 ec 0c             	sub    $0xc,%esp
80103ad3:	68 20 2d 11 80       	push   $0x80112d20
80103ad8:	e8 43 09 00 00       	call   80104420 <release>

  }
80103add:	83 c4 10             	add    $0x10,%esp
80103ae0:	e9 6b ff ff ff       	jmp    80103a50 <scheduler+0x20>
80103ae5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103af0 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103af0:	55                   	push   %ebp
80103af1:	89 e5                	mov    %esp,%ebp
80103af3:	56                   	push   %esi
80103af4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103af5:	e8 96 07 00 00       	call   80104290 <pushcli>
  c = mycpu();
80103afa:	e8 d1 fb ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103aff:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b05:	e8 c6 07 00 00       	call   801042d0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b0a:	83 ec 0c             	sub    $0xc,%esp
80103b0d:	68 20 2d 11 80       	push   $0x80112d20
80103b12:	e8 29 08 00 00       	call   80104340 <holding>
80103b17:	83 c4 10             	add    $0x10,%esp
80103b1a:	85 c0                	test   %eax,%eax
80103b1c:	74 4f                	je     80103b6d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b1e:	e8 ad fb ff ff       	call   801036d0 <mycpu>
80103b23:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b2a:	75 68                	jne    80103b94 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b2c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b30:	74 55                	je     80103b87 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b32:	9c                   	pushf  
80103b33:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b34:	f6 c4 02             	test   $0x2,%ah
80103b37:	75 41                	jne    80103b7a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b39:	e8 92 fb ff ff       	call   801036d0 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b3e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b41:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b47:	e8 84 fb ff ff       	call   801036d0 <mycpu>
80103b4c:	83 ec 08             	sub    $0x8,%esp
80103b4f:	ff 70 04             	pushl  0x4(%eax)
80103b52:	53                   	push   %ebx
80103b53:	e8 73 0b 00 00       	call   801046cb <swtch>
  mycpu()->intena = intena;
80103b58:	e8 73 fb ff ff       	call   801036d0 <mycpu>
}
80103b5d:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103b60:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103b66:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103b69:	5b                   	pop    %ebx
80103b6a:	5e                   	pop    %esi
80103b6b:	5d                   	pop    %ebp
80103b6c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103b6d:	83 ec 0c             	sub    $0xc,%esp
80103b70:	68 d0 74 10 80       	push   $0x801074d0
80103b75:	e8 f6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103b7a:	83 ec 0c             	sub    $0xc,%esp
80103b7d:	68 fc 74 10 80       	push   $0x801074fc
80103b82:	e8 e9 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103b87:	83 ec 0c             	sub    $0xc,%esp
80103b8a:	68 ee 74 10 80       	push   $0x801074ee
80103b8f:	e8 dc c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103b94:	83 ec 0c             	sub    $0xc,%esp
80103b97:	68 e2 74 10 80       	push   $0x801074e2
80103b9c:	e8 cf c7 ff ff       	call   80100370 <panic>
80103ba1:	eb 0d                	jmp    80103bb0 <exit>
80103ba3:	90                   	nop
80103ba4:	90                   	nop
80103ba5:	90                   	nop
80103ba6:	90                   	nop
80103ba7:	90                   	nop
80103ba8:	90                   	nop
80103ba9:	90                   	nop
80103baa:	90                   	nop
80103bab:	90                   	nop
80103bac:	90                   	nop
80103bad:	90                   	nop
80103bae:	90                   	nop
80103baf:	90                   	nop

80103bb0 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103bb0:	55                   	push   %ebp
80103bb1:	89 e5                	mov    %esp,%ebp
80103bb3:	57                   	push   %edi
80103bb4:	56                   	push   %esi
80103bb5:	53                   	push   %ebx
80103bb6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103bb9:	e8 d2 06 00 00       	call   80104290 <pushcli>
  c = mycpu();
80103bbe:	e8 0d fb ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103bc3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103bc9:	e8 02 07 00 00       	call   801042d0 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
80103bce:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103bd4:	8d 5e 28             	lea    0x28(%esi),%ebx
80103bd7:	8d 7e 68             	lea    0x68(%esi),%edi
80103bda:	0f 84 e7 00 00 00    	je     80103cc7 <exit+0x117>
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103be0:	8b 03                	mov    (%ebx),%eax
80103be2:	85 c0                	test   %eax,%eax
80103be4:	74 12                	je     80103bf8 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103be6:	83 ec 0c             	sub    $0xc,%esp
80103be9:	50                   	push   %eax
80103bea:	e8 41 d2 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103bef:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103bf5:	83 c4 10             	add    $0x10,%esp
80103bf8:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103bfb:	39 df                	cmp    %ebx,%edi
80103bfd:	75 e1                	jne    80103be0 <exit+0x30>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103bff:	e8 3c ef ff ff       	call   80102b40 <begin_op>
  iput(curproc->cwd);
80103c04:	83 ec 0c             	sub    $0xc,%esp
80103c07:	ff 76 68             	pushl  0x68(%esi)
80103c0a:	e8 81 db ff ff       	call   80101790 <iput>
  end_op();
80103c0f:	e8 9c ef ff ff       	call   80102bb0 <end_op>
  curproc->cwd = 0;
80103c14:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c1b:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103c22:	e8 49 07 00 00       	call   80104370 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c27:	8b 56 14             	mov    0x14(%esi),%edx
80103c2a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c2d:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c32:	eb 0e                	jmp    80103c42 <exit+0x92>
80103c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c38:	83 e8 80             	sub    $0xffffff80,%eax
80103c3b:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c40:	74 1c                	je     80103c5e <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103c42:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c46:	75 f0                	jne    80103c38 <exit+0x88>
80103c48:	3b 50 20             	cmp    0x20(%eax),%edx
80103c4b:	75 eb                	jne    80103c38 <exit+0x88>
      p->state = RUNNABLE;
80103c4d:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c54:	83 e8 80             	sub    $0xffffff80,%eax
80103c57:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c5c:	75 e4                	jne    80103c42 <exit+0x92>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c5e:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
80103c64:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103c69:	eb 10                	jmp    80103c7b <exit+0xcb>
80103c6b:	90                   	nop
80103c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c70:	83 ea 80             	sub    $0xffffff80,%edx
80103c73:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103c79:	74 33                	je     80103cae <exit+0xfe>
    if(p->parent == curproc){
80103c7b:	39 72 14             	cmp    %esi,0x14(%edx)
80103c7e:	75 f0                	jne    80103c70 <exit+0xc0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103c80:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103c84:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103c87:	75 e7                	jne    80103c70 <exit+0xc0>
80103c89:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103c8e:	eb 0a                	jmp    80103c9a <exit+0xea>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c90:	83 e8 80             	sub    $0xffffff80,%eax
80103c93:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103c98:	74 d6                	je     80103c70 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103c9a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103c9e:	75 f0                	jne    80103c90 <exit+0xe0>
80103ca0:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ca3:	75 eb                	jne    80103c90 <exit+0xe0>
      p->state = RUNNABLE;
80103ca5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103cac:	eb e2                	jmp    80103c90 <exit+0xe0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103cae:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103cb5:	e8 36 fe ff ff       	call   80103af0 <sched>
  panic("zombie exit");
80103cba:	83 ec 0c             	sub    $0xc,%esp
80103cbd:	68 1d 75 10 80       	push   $0x8010751d
80103cc2:	e8 a9 c6 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");
80103cc7:	83 ec 0c             	sub    $0xc,%esp
80103cca:	68 10 75 10 80       	push   $0x80107510
80103ccf:	e8 9c c6 ff ff       	call   80100370 <panic>
80103cd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103cda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103ce0 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103ce0:	55                   	push   %ebp
80103ce1:	89 e5                	mov    %esp,%ebp
80103ce3:	53                   	push   %ebx
80103ce4:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103ce7:	68 20 2d 11 80       	push   $0x80112d20
80103cec:	e8 7f 06 00 00       	call   80104370 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103cf1:	e8 9a 05 00 00       	call   80104290 <pushcli>
  c = mycpu();
80103cf6:	e8 d5 f9 ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103cfb:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d01:	e8 ca 05 00 00       	call   801042d0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d06:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d0d:	e8 de fd ff ff       	call   80103af0 <sched>
  release(&ptable.lock);
80103d12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d19:	e8 02 07 00 00       	call   80104420 <release>
}
80103d1e:	83 c4 10             	add    $0x10,%esp
80103d21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d24:	c9                   	leave  
80103d25:	c3                   	ret    
80103d26:	8d 76 00             	lea    0x0(%esi),%esi
80103d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d30 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d30:	55                   	push   %ebp
80103d31:	89 e5                	mov    %esp,%ebp
80103d33:	57                   	push   %edi
80103d34:	56                   	push   %esi
80103d35:	53                   	push   %ebx
80103d36:	83 ec 0c             	sub    $0xc,%esp
80103d39:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d3c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d3f:	e8 4c 05 00 00       	call   80104290 <pushcli>
  c = mycpu();
80103d44:	e8 87 f9 ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103d49:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d4f:	e8 7c 05 00 00       	call   801042d0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103d54:	85 db                	test   %ebx,%ebx
80103d56:	0f 84 87 00 00 00    	je     80103de3 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103d5c:	85 f6                	test   %esi,%esi
80103d5e:	74 76                	je     80103dd6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103d60:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103d66:	74 50                	je     80103db8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103d68:	83 ec 0c             	sub    $0xc,%esp
80103d6b:	68 20 2d 11 80       	push   $0x80112d20
80103d70:	e8 fb 05 00 00       	call   80104370 <acquire>
    release(lk);
80103d75:	89 34 24             	mov    %esi,(%esp)
80103d78:	e8 a3 06 00 00       	call   80104420 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103d7d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103d80:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103d87:	e8 64 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103d8c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103d93:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103d9a:	e8 81 06 00 00       	call   80104420 <release>
    acquire(lk);
80103d9f:	89 75 08             	mov    %esi,0x8(%ebp)
80103da2:	83 c4 10             	add    $0x10,%esp
  }
}
80103da5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103da8:	5b                   	pop    %ebx
80103da9:	5e                   	pop    %esi
80103daa:	5f                   	pop    %edi
80103dab:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103dac:	e9 bf 05 00 00       	jmp    80104370 <acquire>
80103db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103db8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103dbb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103dc2:	e8 29 fd ff ff       	call   80103af0 <sched>

  // Tidy up.
  p->chan = 0;
80103dc7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103dce:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103dd1:	5b                   	pop    %ebx
80103dd2:	5e                   	pop    %esi
80103dd3:	5f                   	pop    %edi
80103dd4:	5d                   	pop    %ebp
80103dd5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103dd6:	83 ec 0c             	sub    $0xc,%esp
80103dd9:	68 2f 75 10 80       	push   $0x8010752f
80103dde:	e8 8d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103de3:	83 ec 0c             	sub    $0xc,%esp
80103de6:	68 29 75 10 80       	push   $0x80107529
80103deb:	e8 80 c5 ff ff       	call   80100370 <panic>

80103df0 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103df0:	55                   	push   %ebp
80103df1:	89 e5                	mov    %esp,%ebp
80103df3:	56                   	push   %esi
80103df4:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103df5:	e8 96 04 00 00       	call   80104290 <pushcli>
  c = mycpu();
80103dfa:	e8 d1 f8 ff ff       	call   801036d0 <mycpu>
  p = c->proc;
80103dff:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e05:	e8 c6 04 00 00       	call   801042d0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e0a:	83 ec 0c             	sub    $0xc,%esp
80103e0d:	68 20 2d 11 80       	push   $0x80112d20
80103e12:	e8 59 05 00 00       	call   80104370 <acquire>
80103e17:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e1a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e1c:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103e21:	eb 10                	jmp    80103e33 <wait+0x43>
80103e23:	90                   	nop
80103e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e28:	83 eb 80             	sub    $0xffffff80,%ebx
80103e2b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e31:	74 1d                	je     80103e50 <wait+0x60>
      if(p->parent != curproc)
80103e33:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e36:	75 f0                	jne    80103e28 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e38:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e3c:	74 30                	je     80103e6e <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e3e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103e41:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e46:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103e4c:	75 e5                	jne    80103e33 <wait+0x43>
80103e4e:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103e50:	85 c0                	test   %eax,%eax
80103e52:	74 70                	je     80103ec4 <wait+0xd4>
80103e54:	8b 46 24             	mov    0x24(%esi),%eax
80103e57:	85 c0                	test   %eax,%eax
80103e59:	75 69                	jne    80103ec4 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103e5b:	83 ec 08             	sub    $0x8,%esp
80103e5e:	68 20 2d 11 80       	push   $0x80112d20
80103e63:	56                   	push   %esi
80103e64:	e8 c7 fe ff ff       	call   80103d30 <sleep>
  }
80103e69:	83 c4 10             	add    $0x10,%esp
80103e6c:	eb ac                	jmp    80103e1a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103e6e:	83 ec 0c             	sub    $0xc,%esp
80103e71:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103e74:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103e77:	e8 54 e4 ff ff       	call   801022d0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103e7c:	5a                   	pop    %edx
80103e7d:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103e80:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103e87:	e8 74 2d 00 00       	call   80106c00 <freevm>
        p->pid = 0;
80103e8c:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103e93:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103e9a:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103e9e:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ea5:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103eac:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eb3:	e8 68 05 00 00       	call   80104420 <release>
        return pid;
80103eb8:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ebb:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103ebe:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ec0:	5b                   	pop    %ebx
80103ec1:	5e                   	pop    %esi
80103ec2:	5d                   	pop    %ebp
80103ec3:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103ec4:	83 ec 0c             	sub    $0xc,%esp
80103ec7:	68 20 2d 11 80       	push   $0x80112d20
80103ecc:	e8 4f 05 00 00       	call   80104420 <release>
      return -1;
80103ed1:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103ed4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103ed7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103edc:	5b                   	pop    %ebx
80103edd:	5e                   	pop    %esi
80103ede:	5d                   	pop    %ebp
80103edf:	c3                   	ret    

80103ee0 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103ee0:	55                   	push   %ebp
80103ee1:	89 e5                	mov    %esp,%ebp
80103ee3:	53                   	push   %ebx
80103ee4:	83 ec 10             	sub    $0x10,%esp
80103ee7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103eea:	68 20 2d 11 80       	push   $0x80112d20
80103eef:	e8 7c 04 00 00       	call   80104370 <acquire>
80103ef4:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103ef7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103efc:	eb 0c                	jmp    80103f0a <wakeup+0x2a>
80103efe:	66 90                	xchg   %ax,%ax
80103f00:	83 e8 80             	sub    $0xffffff80,%eax
80103f03:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f08:	74 1c                	je     80103f26 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f0a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f0e:	75 f0                	jne    80103f00 <wakeup+0x20>
80103f10:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f13:	75 eb                	jne    80103f00 <wakeup+0x20>
      p->state = RUNNABLE;
80103f15:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f1c:	83 e8 80             	sub    $0xffffff80,%eax
80103f1f:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f24:	75 e4                	jne    80103f0a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f26:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
80103f2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f30:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f31:	e9 ea 04 00 00       	jmp    80104420 <release>
80103f36:	8d 76 00             	lea    0x0(%esi),%esi
80103f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f40 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103f4a:	68 20 2d 11 80       	push   $0x80112d20
80103f4f:	e8 1c 04 00 00       	call   80104370 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f57:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103f5c:	eb 0c                	jmp    80103f6a <kill+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 e8 80             	sub    $0xffffff80,%eax
80103f63:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103f68:	74 3e                	je     80103fa8 <kill+0x68>
    if(p->pid == pid){
80103f6a:	39 58 10             	cmp    %ebx,0x10(%eax)
80103f6d:	75 f1                	jne    80103f60 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f6f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103f73:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103f7a:	74 1c                	je     80103f98 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103f7c:	83 ec 0c             	sub    $0xc,%esp
80103f7f:	68 20 2d 11 80       	push   $0x80112d20
80103f84:	e8 97 04 00 00       	call   80104420 <release>
      return 0;
80103f89:	83 c4 10             	add    $0x10,%esp
80103f8c:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103f8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f91:	c9                   	leave  
80103f92:	c3                   	ret    
80103f93:	90                   	nop
80103f94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103f98:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103f9f:	eb db                	jmp    80103f7c <kill+0x3c>
80103fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80103fa8:	83 ec 0c             	sub    $0xc,%esp
80103fab:	68 20 2d 11 80       	push   $0x80112d20
80103fb0:	e8 6b 04 00 00       	call   80104420 <release>
  return -1;
80103fb5:	83 c4 10             	add    $0x10,%esp
80103fb8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80103fbd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fc0:	c9                   	leave  
80103fc1:	c3                   	ret    
80103fc2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fd0 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80103fd0:	55                   	push   %ebp
80103fd1:	89 e5                	mov    %esp,%ebp
80103fd3:	57                   	push   %edi
80103fd4:	56                   	push   %esi
80103fd5:	53                   	push   %ebx
80103fd6:	8d 75 e8             	lea    -0x18(%ebp),%esi
80103fd9:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80103fde:	83 ec 3c             	sub    $0x3c,%esp
80103fe1:	eb 24                	jmp    80104007 <procdump+0x37>
80103fe3:	90                   	nop
80103fe4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80103fe8:	83 ec 0c             	sub    $0xc,%esp
80103feb:	68 db 78 10 80       	push   $0x801078db
80103ff0:	e8 6b c6 ff ff       	call   80100660 <cprintf>
80103ff5:	83 c4 10             	add    $0x10,%esp
80103ff8:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ffb:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
80104001:	0f 84 81 00 00 00    	je     80104088 <procdump+0xb8>
    if(p->state == UNUSED)
80104007:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010400a:	85 c0                	test   %eax,%eax
8010400c:	74 ea                	je     80103ff8 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010400e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104011:	ba 40 75 10 80       	mov    $0x80107540,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104016:	77 11                	ja     80104029 <procdump+0x59>
80104018:	8b 14 85 b4 75 10 80 	mov    -0x7fef8a4c(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010401f:	b8 40 75 10 80       	mov    $0x80107540,%eax
80104024:	85 d2                	test   %edx,%edx
80104026:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104029:	53                   	push   %ebx
8010402a:	52                   	push   %edx
8010402b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010402e:	68 44 75 10 80       	push   $0x80107544
80104033:	e8 28 c6 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104038:	83 c4 10             	add    $0x10,%esp
8010403b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010403f:	75 a7                	jne    80103fe8 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104041:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104044:	83 ec 08             	sub    $0x8,%esp
80104047:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010404a:	50                   	push   %eax
8010404b:	8b 43 b0             	mov    -0x50(%ebx),%eax
8010404e:	8b 40 0c             	mov    0xc(%eax),%eax
80104051:	83 c0 08             	add    $0x8,%eax
80104054:	50                   	push   %eax
80104055:	e8 d6 01 00 00       	call   80104230 <getcallerpcs>
8010405a:	83 c4 10             	add    $0x10,%esp
8010405d:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
80104060:	8b 17                	mov    (%edi),%edx
80104062:	85 d2                	test   %edx,%edx
80104064:	74 82                	je     80103fe8 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104066:	83 ec 08             	sub    $0x8,%esp
80104069:	83 c7 04             	add    $0x4,%edi
8010406c:	52                   	push   %edx
8010406d:	68 81 6f 10 80       	push   $0x80106f81
80104072:	e8 e9 c5 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
80104077:	83 c4 10             	add    $0x10,%esp
8010407a:	39 f7                	cmp    %esi,%edi
8010407c:	75 e2                	jne    80104060 <procdump+0x90>
8010407e:	e9 65 ff ff ff       	jmp    80103fe8 <procdump+0x18>
80104083:	90                   	nop
80104084:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
80104088:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010408b:	5b                   	pop    %ebx
8010408c:	5e                   	pop    %esi
8010408d:	5f                   	pop    %edi
8010408e:	5d                   	pop    %ebp
8010408f:	c3                   	ret    

80104090 <cps>:

int
cps(void)
{
80104090:	55                   	push   %ebp
80104091:	89 e5                	mov    %esp,%ebp
80104093:	53                   	push   %ebx
80104094:	bb c0 2d 11 80       	mov    $0x80112dc0,%ebx
80104099:	83 ec 04             	sub    $0x4,%esp
8010409c:	eb 2b                	jmp    801040c9 <cps+0x39>
8010409e:	66 90                	xchg   %ax,%ax
  
  struct proc *p=ptable.proc;
  // Iterate through process table
  while(p < &ptable.proc[NPROC] && p->state!=UNUSED)
  {
  	cprintf("(%d, %s, %s, %d)\n", p->pid,p->name,states[p->state], p->priority); 
801040a0:	83 ec 0c             	sub    $0xc,%esp
801040a3:	ff 73 10             	pushl  0x10(%ebx)
801040a6:	ff 34 85 b4 75 10 80 	pushl  -0x7fef8a4c(,%eax,4)
801040ad:	53                   	push   %ebx
801040ae:	ff 73 a4             	pushl  -0x5c(%ebx)
801040b1:	83 eb 80             	sub    $0xffffff80,%ebx
801040b4:	68 4d 75 10 80       	push   $0x8010754d
801040b9:	e8 a2 c5 ff ff       	call   80100660 <cprintf>
  [ZOMBIE]    "zombie"
  };
  
  struct proc *p=ptable.proc;
  // Iterate through process table
  while(p < &ptable.proc[NPROC] && p->state!=UNUSED)
801040be:	83 c4 20             	add    $0x20,%esp
801040c1:	81 fb c0 4d 11 80    	cmp    $0x80114dc0,%ebx
801040c7:	74 07                	je     801040d0 <cps+0x40>
801040c9:	8b 43 a0             	mov    -0x60(%ebx),%eax
801040cc:	85 c0                	test   %eax,%eax
801040ce:	75 d0                	jne    801040a0 <cps+0x10>
  	cprintf("(%d, %s, %s, %d)\n", p->pid,p->name,states[p->state], p->priority); 
	p++; 	
  }
  return 0;
  exit();
}
801040d0:	31 c0                	xor    %eax,%eax
801040d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d5:	c9                   	leave  
801040d6:	c3                   	ret    
801040d7:	66 90                	xchg   %ax,%ax
801040d9:	66 90                	xchg   %ax,%ax
801040db:	66 90                	xchg   %ax,%ax
801040dd:	66 90                	xchg   %ax,%ax
801040df:	90                   	nop

801040e0 <initsleeplock>:
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 0c             	sub    $0xc,%esp
801040e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801040ea:	68 cc 75 10 80       	push   $0x801075cc
801040ef:	8d 43 04             	lea    0x4(%ebx),%eax
801040f2:	50                   	push   %eax
801040f3:	e8 18 01 00 00       	call   80104210 <initlock>
801040f8:	8b 45 0c             	mov    0xc(%ebp),%eax
801040fb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104101:	83 c4 10             	add    $0x10,%esp
80104104:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010410b:	89 43 38             	mov    %eax,0x38(%ebx)
8010410e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104111:	c9                   	leave  
80104112:	c3                   	ret    
80104113:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104120 <acquiresleep>:
80104120:	55                   	push   %ebp
80104121:	89 e5                	mov    %esp,%ebp
80104123:	56                   	push   %esi
80104124:	53                   	push   %ebx
80104125:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104128:	83 ec 0c             	sub    $0xc,%esp
8010412b:	8d 73 04             	lea    0x4(%ebx),%esi
8010412e:	56                   	push   %esi
8010412f:	e8 3c 02 00 00       	call   80104370 <acquire>
80104134:	8b 13                	mov    (%ebx),%edx
80104136:	83 c4 10             	add    $0x10,%esp
80104139:	85 d2                	test   %edx,%edx
8010413b:	74 16                	je     80104153 <acquiresleep+0x33>
8010413d:	8d 76 00             	lea    0x0(%esi),%esi
80104140:	83 ec 08             	sub    $0x8,%esp
80104143:	56                   	push   %esi
80104144:	53                   	push   %ebx
80104145:	e8 e6 fb ff ff       	call   80103d30 <sleep>
8010414a:	8b 03                	mov    (%ebx),%eax
8010414c:	83 c4 10             	add    $0x10,%esp
8010414f:	85 c0                	test   %eax,%eax
80104151:	75 ed                	jne    80104140 <acquiresleep+0x20>
80104153:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104159:	e8 12 f6 ff ff       	call   80103770 <myproc>
8010415e:	8b 40 10             	mov    0x10(%eax),%eax
80104161:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104164:	89 75 08             	mov    %esi,0x8(%ebp)
80104167:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010416a:	5b                   	pop    %ebx
8010416b:	5e                   	pop    %esi
8010416c:	5d                   	pop    %ebp
8010416d:	e9 ae 02 00 00       	jmp    80104420 <release>
80104172:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104180 <releasesleep>:
80104180:	55                   	push   %ebp
80104181:	89 e5                	mov    %esp,%ebp
80104183:	56                   	push   %esi
80104184:	53                   	push   %ebx
80104185:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104188:	83 ec 0c             	sub    $0xc,%esp
8010418b:	8d 73 04             	lea    0x4(%ebx),%esi
8010418e:	56                   	push   %esi
8010418f:	e8 dc 01 00 00       	call   80104370 <acquire>
80104194:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010419a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801041a1:	89 1c 24             	mov    %ebx,(%esp)
801041a4:	e8 37 fd ff ff       	call   80103ee0 <wakeup>
801041a9:	89 75 08             	mov    %esi,0x8(%ebp)
801041ac:	83 c4 10             	add    $0x10,%esp
801041af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041b2:	5b                   	pop    %ebx
801041b3:	5e                   	pop    %esi
801041b4:	5d                   	pop    %ebp
801041b5:	e9 66 02 00 00       	jmp    80104420 <release>
801041ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801041c0 <holdingsleep>:
801041c0:	55                   	push   %ebp
801041c1:	89 e5                	mov    %esp,%ebp
801041c3:	57                   	push   %edi
801041c4:	56                   	push   %esi
801041c5:	53                   	push   %ebx
801041c6:	31 ff                	xor    %edi,%edi
801041c8:	83 ec 18             	sub    $0x18,%esp
801041cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801041ce:	8d 73 04             	lea    0x4(%ebx),%esi
801041d1:	56                   	push   %esi
801041d2:	e8 99 01 00 00       	call   80104370 <acquire>
801041d7:	8b 03                	mov    (%ebx),%eax
801041d9:	83 c4 10             	add    $0x10,%esp
801041dc:	85 c0                	test   %eax,%eax
801041de:	74 13                	je     801041f3 <holdingsleep+0x33>
801041e0:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801041e3:	e8 88 f5 ff ff       	call   80103770 <myproc>
801041e8:	39 58 10             	cmp    %ebx,0x10(%eax)
801041eb:	0f 94 c0             	sete   %al
801041ee:	0f b6 c0             	movzbl %al,%eax
801041f1:	89 c7                	mov    %eax,%edi
801041f3:	83 ec 0c             	sub    $0xc,%esp
801041f6:	56                   	push   %esi
801041f7:	e8 24 02 00 00       	call   80104420 <release>
801041fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041ff:	89 f8                	mov    %edi,%eax
80104201:	5b                   	pop    %ebx
80104202:	5e                   	pop    %esi
80104203:	5f                   	pop    %edi
80104204:	5d                   	pop    %ebp
80104205:	c3                   	ret    
80104206:	66 90                	xchg   %ax,%ax
80104208:	66 90                	xchg   %ax,%ax
8010420a:	66 90                	xchg   %ax,%ax
8010420c:	66 90                	xchg   %ax,%ax
8010420e:	66 90                	xchg   %ax,%ax

80104210 <initlock>:
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	8b 45 08             	mov    0x8(%ebp),%eax
80104216:	8b 55 0c             	mov    0xc(%ebp),%edx
80104219:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010421f:	89 50 04             	mov    %edx,0x4(%eax)
80104222:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104229:	5d                   	pop    %ebp
8010422a:	c3                   	ret    
8010422b:	90                   	nop
8010422c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104230 <getcallerpcs>:
80104230:	55                   	push   %ebp
80104231:	89 e5                	mov    %esp,%ebp
80104233:	53                   	push   %ebx
80104234:	8b 45 08             	mov    0x8(%ebp),%eax
80104237:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010423a:	8d 50 f8             	lea    -0x8(%eax),%edx
8010423d:	31 c0                	xor    %eax,%eax
8010423f:	90                   	nop
80104240:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104246:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010424c:	77 1a                	ja     80104268 <getcallerpcs+0x38>
8010424e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104251:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104254:	83 c0 01             	add    $0x1,%eax
80104257:	8b 12                	mov    (%edx),%edx
80104259:	83 f8 0a             	cmp    $0xa,%eax
8010425c:	75 e2                	jne    80104240 <getcallerpcs+0x10>
8010425e:	5b                   	pop    %ebx
8010425f:	5d                   	pop    %ebp
80104260:	c3                   	ret    
80104261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104268:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010426f:	83 c0 01             	add    $0x1,%eax
80104272:	83 f8 0a             	cmp    $0xa,%eax
80104275:	74 e7                	je     8010425e <getcallerpcs+0x2e>
80104277:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
8010427e:	83 c0 01             	add    $0x1,%eax
80104281:	83 f8 0a             	cmp    $0xa,%eax
80104284:	75 e2                	jne    80104268 <getcallerpcs+0x38>
80104286:	eb d6                	jmp    8010425e <getcallerpcs+0x2e>
80104288:	90                   	nop
80104289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104290 <pushcli>:
80104290:	55                   	push   %ebp
80104291:	89 e5                	mov    %esp,%ebp
80104293:	53                   	push   %ebx
80104294:	83 ec 04             	sub    $0x4,%esp
80104297:	9c                   	pushf  
80104298:	5b                   	pop    %ebx
80104299:	fa                   	cli    
8010429a:	e8 31 f4 ff ff       	call   801036d0 <mycpu>
8010429f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801042a5:	85 c0                	test   %eax,%eax
801042a7:	75 11                	jne    801042ba <pushcli+0x2a>
801042a9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801042af:	e8 1c f4 ff ff       	call   801036d0 <mycpu>
801042b4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801042ba:	e8 11 f4 ff ff       	call   801036d0 <mycpu>
801042bf:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801042c6:	83 c4 04             	add    $0x4,%esp
801042c9:	5b                   	pop    %ebx
801042ca:	5d                   	pop    %ebp
801042cb:	c3                   	ret    
801042cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042d0 <popcli>:
801042d0:	55                   	push   %ebp
801042d1:	89 e5                	mov    %esp,%ebp
801042d3:	83 ec 08             	sub    $0x8,%esp
801042d6:	9c                   	pushf  
801042d7:	58                   	pop    %eax
801042d8:	f6 c4 02             	test   $0x2,%ah
801042db:	75 52                	jne    8010432f <popcli+0x5f>
801042dd:	e8 ee f3 ff ff       	call   801036d0 <mycpu>
801042e2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
801042e8:	8d 51 ff             	lea    -0x1(%ecx),%edx
801042eb:	85 d2                	test   %edx,%edx
801042ed:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
801042f3:	78 2d                	js     80104322 <popcli+0x52>
801042f5:	e8 d6 f3 ff ff       	call   801036d0 <mycpu>
801042fa:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104300:	85 d2                	test   %edx,%edx
80104302:	74 0c                	je     80104310 <popcli+0x40>
80104304:	c9                   	leave  
80104305:	c3                   	ret    
80104306:	8d 76 00             	lea    0x0(%esi),%esi
80104309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104310:	e8 bb f3 ff ff       	call   801036d0 <mycpu>
80104315:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010431b:	85 c0                	test   %eax,%eax
8010431d:	74 e5                	je     80104304 <popcli+0x34>
8010431f:	fb                   	sti    
80104320:	c9                   	leave  
80104321:	c3                   	ret    
80104322:	83 ec 0c             	sub    $0xc,%esp
80104325:	68 ee 75 10 80       	push   $0x801075ee
8010432a:	e8 41 c0 ff ff       	call   80100370 <panic>
8010432f:	83 ec 0c             	sub    $0xc,%esp
80104332:	68 d7 75 10 80       	push   $0x801075d7
80104337:	e8 34 c0 ff ff       	call   80100370 <panic>
8010433c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104340 <holding>:
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
80104345:	8b 75 08             	mov    0x8(%ebp),%esi
80104348:	31 db                	xor    %ebx,%ebx
8010434a:	e8 41 ff ff ff       	call   80104290 <pushcli>
8010434f:	8b 06                	mov    (%esi),%eax
80104351:	85 c0                	test   %eax,%eax
80104353:	74 10                	je     80104365 <holding+0x25>
80104355:	8b 5e 08             	mov    0x8(%esi),%ebx
80104358:	e8 73 f3 ff ff       	call   801036d0 <mycpu>
8010435d:	39 c3                	cmp    %eax,%ebx
8010435f:	0f 94 c3             	sete   %bl
80104362:	0f b6 db             	movzbl %bl,%ebx
80104365:	e8 66 ff ff ff       	call   801042d0 <popcli>
8010436a:	89 d8                	mov    %ebx,%eax
8010436c:	5b                   	pop    %ebx
8010436d:	5e                   	pop    %esi
8010436e:	5d                   	pop    %ebp
8010436f:	c3                   	ret    

80104370 <acquire>:
80104370:	55                   	push   %ebp
80104371:	89 e5                	mov    %esp,%ebp
80104373:	53                   	push   %ebx
80104374:	83 ec 04             	sub    $0x4,%esp
80104377:	e8 14 ff ff ff       	call   80104290 <pushcli>
8010437c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010437f:	83 ec 0c             	sub    $0xc,%esp
80104382:	53                   	push   %ebx
80104383:	e8 b8 ff ff ff       	call   80104340 <holding>
80104388:	83 c4 10             	add    $0x10,%esp
8010438b:	85 c0                	test   %eax,%eax
8010438d:	0f 85 7d 00 00 00    	jne    80104410 <acquire+0xa0>
80104393:	ba 01 00 00 00       	mov    $0x1,%edx
80104398:	eb 09                	jmp    801043a3 <acquire+0x33>
8010439a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043a0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043a3:	89 d0                	mov    %edx,%eax
801043a5:	f0 87 03             	lock xchg %eax,(%ebx)
801043a8:	85 c0                	test   %eax,%eax
801043aa:	75 f4                	jne    801043a0 <acquire+0x30>
801043ac:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801043b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801043b4:	e8 17 f3 ff ff       	call   801036d0 <mycpu>
801043b9:	89 ea                	mov    %ebp,%edx
801043bb:	8d 4b 0c             	lea    0xc(%ebx),%ecx
801043be:	89 43 08             	mov    %eax,0x8(%ebx)
801043c1:	31 c0                	xor    %eax,%eax
801043c3:	90                   	nop
801043c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043c8:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
801043ce:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
801043d4:	77 1a                	ja     801043f0 <acquire+0x80>
801043d6:	8b 5a 04             	mov    0x4(%edx),%ebx
801043d9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
801043dc:	83 c0 01             	add    $0x1,%eax
801043df:	8b 12                	mov    (%edx),%edx
801043e1:	83 f8 0a             	cmp    $0xa,%eax
801043e4:	75 e2                	jne    801043c8 <acquire+0x58>
801043e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801043e9:	c9                   	leave  
801043ea:	c3                   	ret    
801043eb:	90                   	nop
801043ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801043f0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
801043f7:	83 c0 01             	add    $0x1,%eax
801043fa:	83 f8 0a             	cmp    $0xa,%eax
801043fd:	74 e7                	je     801043e6 <acquire+0x76>
801043ff:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104406:	83 c0 01             	add    $0x1,%eax
80104409:	83 f8 0a             	cmp    $0xa,%eax
8010440c:	75 e2                	jne    801043f0 <acquire+0x80>
8010440e:	eb d6                	jmp    801043e6 <acquire+0x76>
80104410:	83 ec 0c             	sub    $0xc,%esp
80104413:	68 f5 75 10 80       	push   $0x801075f5
80104418:	e8 53 bf ff ff       	call   80100370 <panic>
8010441d:	8d 76 00             	lea    0x0(%esi),%esi

80104420 <release>:
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	53                   	push   %ebx
80104424:	83 ec 10             	sub    $0x10,%esp
80104427:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010442a:	53                   	push   %ebx
8010442b:	e8 10 ff ff ff       	call   80104340 <holding>
80104430:	83 c4 10             	add    $0x10,%esp
80104433:	85 c0                	test   %eax,%eax
80104435:	74 22                	je     80104459 <release+0x39>
80104437:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010443e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104445:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010444a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104450:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104453:	c9                   	leave  
80104454:	e9 77 fe ff ff       	jmp    801042d0 <popcli>
80104459:	83 ec 0c             	sub    $0xc,%esp
8010445c:	68 fd 75 10 80       	push   $0x801075fd
80104461:	e8 0a bf ff ff       	call   80100370 <panic>
80104466:	66 90                	xchg   %ax,%ax
80104468:	66 90                	xchg   %ax,%ax
8010446a:	66 90                	xchg   %ax,%ax
8010446c:	66 90                	xchg   %ax,%ax
8010446e:	66 90                	xchg   %ax,%ax

80104470 <memset>:
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	57                   	push   %edi
80104474:	53                   	push   %ebx
80104475:	8b 55 08             	mov    0x8(%ebp),%edx
80104478:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010447b:	f6 c2 03             	test   $0x3,%dl
8010447e:	75 05                	jne    80104485 <memset+0x15>
80104480:	f6 c1 03             	test   $0x3,%cl
80104483:	74 13                	je     80104498 <memset+0x28>
80104485:	89 d7                	mov    %edx,%edi
80104487:	8b 45 0c             	mov    0xc(%ebp),%eax
8010448a:	fc                   	cld    
8010448b:	f3 aa                	rep stos %al,%es:(%edi)
8010448d:	5b                   	pop    %ebx
8010448e:	89 d0                	mov    %edx,%eax
80104490:	5f                   	pop    %edi
80104491:	5d                   	pop    %ebp
80104492:	c3                   	ret    
80104493:	90                   	nop
80104494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104498:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
8010449c:	c1 e9 02             	shr    $0x2,%ecx
8010449f:	89 fb                	mov    %edi,%ebx
801044a1:	89 f8                	mov    %edi,%eax
801044a3:	c1 e3 18             	shl    $0x18,%ebx
801044a6:	c1 e0 10             	shl    $0x10,%eax
801044a9:	09 d8                	or     %ebx,%eax
801044ab:	09 f8                	or     %edi,%eax
801044ad:	c1 e7 08             	shl    $0x8,%edi
801044b0:	09 f8                	or     %edi,%eax
801044b2:	89 d7                	mov    %edx,%edi
801044b4:	fc                   	cld    
801044b5:	f3 ab                	rep stos %eax,%es:(%edi)
801044b7:	5b                   	pop    %ebx
801044b8:	89 d0                	mov    %edx,%eax
801044ba:	5f                   	pop    %edi
801044bb:	5d                   	pop    %ebp
801044bc:	c3                   	ret    
801044bd:	8d 76 00             	lea    0x0(%esi),%esi

801044c0 <memcmp>:
801044c0:	55                   	push   %ebp
801044c1:	89 e5                	mov    %esp,%ebp
801044c3:	57                   	push   %edi
801044c4:	56                   	push   %esi
801044c5:	8b 45 10             	mov    0x10(%ebp),%eax
801044c8:	53                   	push   %ebx
801044c9:	8b 75 0c             	mov    0xc(%ebp),%esi
801044cc:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044cf:	85 c0                	test   %eax,%eax
801044d1:	74 29                	je     801044fc <memcmp+0x3c>
801044d3:	0f b6 13             	movzbl (%ebx),%edx
801044d6:	0f b6 0e             	movzbl (%esi),%ecx
801044d9:	38 d1                	cmp    %dl,%cl
801044db:	75 2b                	jne    80104508 <memcmp+0x48>
801044dd:	8d 78 ff             	lea    -0x1(%eax),%edi
801044e0:	31 c0                	xor    %eax,%eax
801044e2:	eb 14                	jmp    801044f8 <memcmp+0x38>
801044e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044e8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
801044ed:	83 c0 01             	add    $0x1,%eax
801044f0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
801044f4:	38 ca                	cmp    %cl,%dl
801044f6:	75 10                	jne    80104508 <memcmp+0x48>
801044f8:	39 f8                	cmp    %edi,%eax
801044fa:	75 ec                	jne    801044e8 <memcmp+0x28>
801044fc:	5b                   	pop    %ebx
801044fd:	31 c0                	xor    %eax,%eax
801044ff:	5e                   	pop    %esi
80104500:	5f                   	pop    %edi
80104501:	5d                   	pop    %ebp
80104502:	c3                   	ret    
80104503:	90                   	nop
80104504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104508:	0f b6 c2             	movzbl %dl,%eax
8010450b:	5b                   	pop    %ebx
8010450c:	29 c8                	sub    %ecx,%eax
8010450e:	5e                   	pop    %esi
8010450f:	5f                   	pop    %edi
80104510:	5d                   	pop    %ebp
80104511:	c3                   	ret    
80104512:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104520 <memmove>:
80104520:	55                   	push   %ebp
80104521:	89 e5                	mov    %esp,%ebp
80104523:	56                   	push   %esi
80104524:	53                   	push   %ebx
80104525:	8b 45 08             	mov    0x8(%ebp),%eax
80104528:	8b 75 0c             	mov    0xc(%ebp),%esi
8010452b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010452e:	39 c6                	cmp    %eax,%esi
80104530:	73 2e                	jae    80104560 <memmove+0x40>
80104532:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104535:	39 c8                	cmp    %ecx,%eax
80104537:	73 27                	jae    80104560 <memmove+0x40>
80104539:	85 db                	test   %ebx,%ebx
8010453b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010453e:	74 17                	je     80104557 <memmove+0x37>
80104540:	29 d9                	sub    %ebx,%ecx
80104542:	89 cb                	mov    %ecx,%ebx
80104544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104548:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010454c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010454f:	83 ea 01             	sub    $0x1,%edx
80104552:	83 fa ff             	cmp    $0xffffffff,%edx
80104555:	75 f1                	jne    80104548 <memmove+0x28>
80104557:	5b                   	pop    %ebx
80104558:	5e                   	pop    %esi
80104559:	5d                   	pop    %ebp
8010455a:	c3                   	ret    
8010455b:	90                   	nop
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104560:	31 d2                	xor    %edx,%edx
80104562:	85 db                	test   %ebx,%ebx
80104564:	74 f1                	je     80104557 <memmove+0x37>
80104566:	8d 76 00             	lea    0x0(%esi),%esi
80104569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104570:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104574:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104577:	83 c2 01             	add    $0x1,%edx
8010457a:	39 d3                	cmp    %edx,%ebx
8010457c:	75 f2                	jne    80104570 <memmove+0x50>
8010457e:	5b                   	pop    %ebx
8010457f:	5e                   	pop    %esi
80104580:	5d                   	pop    %ebp
80104581:	c3                   	ret    
80104582:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104590 <memcpy>:
80104590:	55                   	push   %ebp
80104591:	89 e5                	mov    %esp,%ebp
80104593:	5d                   	pop    %ebp
80104594:	eb 8a                	jmp    80104520 <memmove>
80104596:	8d 76 00             	lea    0x0(%esi),%esi
80104599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045a0 <strncmp>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	57                   	push   %edi
801045a4:	56                   	push   %esi
801045a5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045a8:	53                   	push   %ebx
801045a9:	8b 7d 08             	mov    0x8(%ebp),%edi
801045ac:	8b 75 0c             	mov    0xc(%ebp),%esi
801045af:	85 c9                	test   %ecx,%ecx
801045b1:	74 37                	je     801045ea <strncmp+0x4a>
801045b3:	0f b6 17             	movzbl (%edi),%edx
801045b6:	0f b6 1e             	movzbl (%esi),%ebx
801045b9:	84 d2                	test   %dl,%dl
801045bb:	74 3f                	je     801045fc <strncmp+0x5c>
801045bd:	38 d3                	cmp    %dl,%bl
801045bf:	75 3b                	jne    801045fc <strncmp+0x5c>
801045c1:	8d 47 01             	lea    0x1(%edi),%eax
801045c4:	01 cf                	add    %ecx,%edi
801045c6:	eb 1b                	jmp    801045e3 <strncmp+0x43>
801045c8:	90                   	nop
801045c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045d0:	0f b6 10             	movzbl (%eax),%edx
801045d3:	84 d2                	test   %dl,%dl
801045d5:	74 21                	je     801045f8 <strncmp+0x58>
801045d7:	0f b6 19             	movzbl (%ecx),%ebx
801045da:	83 c0 01             	add    $0x1,%eax
801045dd:	89 ce                	mov    %ecx,%esi
801045df:	38 da                	cmp    %bl,%dl
801045e1:	75 19                	jne    801045fc <strncmp+0x5c>
801045e3:	39 c7                	cmp    %eax,%edi
801045e5:	8d 4e 01             	lea    0x1(%esi),%ecx
801045e8:	75 e6                	jne    801045d0 <strncmp+0x30>
801045ea:	5b                   	pop    %ebx
801045eb:	31 c0                	xor    %eax,%eax
801045ed:	5e                   	pop    %esi
801045ee:	5f                   	pop    %edi
801045ef:	5d                   	pop    %ebp
801045f0:	c3                   	ret    
801045f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045f8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
801045fc:	0f b6 c2             	movzbl %dl,%eax
801045ff:	29 d8                	sub    %ebx,%eax
80104601:	5b                   	pop    %ebx
80104602:	5e                   	pop    %esi
80104603:	5f                   	pop    %edi
80104604:	5d                   	pop    %ebp
80104605:	c3                   	ret    
80104606:	8d 76 00             	lea    0x0(%esi),%esi
80104609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104610 <strncpy>:
80104610:	55                   	push   %ebp
80104611:	89 e5                	mov    %esp,%ebp
80104613:	56                   	push   %esi
80104614:	53                   	push   %ebx
80104615:	8b 45 08             	mov    0x8(%ebp),%eax
80104618:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010461b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010461e:	89 c2                	mov    %eax,%edx
80104620:	eb 19                	jmp    8010463b <strncpy+0x2b>
80104622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104628:	83 c3 01             	add    $0x1,%ebx
8010462b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010462f:	83 c2 01             	add    $0x1,%edx
80104632:	84 c9                	test   %cl,%cl
80104634:	88 4a ff             	mov    %cl,-0x1(%edx)
80104637:	74 09                	je     80104642 <strncpy+0x32>
80104639:	89 f1                	mov    %esi,%ecx
8010463b:	85 c9                	test   %ecx,%ecx
8010463d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104640:	7f e6                	jg     80104628 <strncpy+0x18>
80104642:	31 c9                	xor    %ecx,%ecx
80104644:	85 f6                	test   %esi,%esi
80104646:	7e 17                	jle    8010465f <strncpy+0x4f>
80104648:	90                   	nop
80104649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104650:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104654:	89 f3                	mov    %esi,%ebx
80104656:	83 c1 01             	add    $0x1,%ecx
80104659:	29 cb                	sub    %ecx,%ebx
8010465b:	85 db                	test   %ebx,%ebx
8010465d:	7f f1                	jg     80104650 <strncpy+0x40>
8010465f:	5b                   	pop    %ebx
80104660:	5e                   	pop    %esi
80104661:	5d                   	pop    %ebp
80104662:	c3                   	ret    
80104663:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104670 <safestrcpy>:
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	56                   	push   %esi
80104674:	53                   	push   %ebx
80104675:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104678:	8b 45 08             	mov    0x8(%ebp),%eax
8010467b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010467e:	85 c9                	test   %ecx,%ecx
80104680:	7e 26                	jle    801046a8 <safestrcpy+0x38>
80104682:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104686:	89 c1                	mov    %eax,%ecx
80104688:	eb 17                	jmp    801046a1 <safestrcpy+0x31>
8010468a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104690:	83 c2 01             	add    $0x1,%edx
80104693:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104697:	83 c1 01             	add    $0x1,%ecx
8010469a:	84 db                	test   %bl,%bl
8010469c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010469f:	74 04                	je     801046a5 <safestrcpy+0x35>
801046a1:	39 f2                	cmp    %esi,%edx
801046a3:	75 eb                	jne    80104690 <safestrcpy+0x20>
801046a5:	c6 01 00             	movb   $0x0,(%ecx)
801046a8:	5b                   	pop    %ebx
801046a9:	5e                   	pop    %esi
801046aa:	5d                   	pop    %ebp
801046ab:	c3                   	ret    
801046ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046b0 <strlen>:
801046b0:	55                   	push   %ebp
801046b1:	31 c0                	xor    %eax,%eax
801046b3:	89 e5                	mov    %esp,%ebp
801046b5:	8b 55 08             	mov    0x8(%ebp),%edx
801046b8:	80 3a 00             	cmpb   $0x0,(%edx)
801046bb:	74 0c                	je     801046c9 <strlen+0x19>
801046bd:	8d 76 00             	lea    0x0(%esi),%esi
801046c0:	83 c0 01             	add    $0x1,%eax
801046c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801046c7:	75 f7                	jne    801046c0 <strlen+0x10>
801046c9:	5d                   	pop    %ebp
801046ca:	c3                   	ret    

801046cb <swtch>:
801046cb:	8b 44 24 04          	mov    0x4(%esp),%eax
801046cf:	8b 54 24 08          	mov    0x8(%esp),%edx
801046d3:	55                   	push   %ebp
801046d4:	53                   	push   %ebx
801046d5:	56                   	push   %esi
801046d6:	57                   	push   %edi
801046d7:	89 20                	mov    %esp,(%eax)
801046d9:	89 d4                	mov    %edx,%esp
801046db:	5f                   	pop    %edi
801046dc:	5e                   	pop    %esi
801046dd:	5b                   	pop    %ebx
801046de:	5d                   	pop    %ebp
801046df:	c3                   	ret    

801046e0 <fetchint>:
801046e0:	55                   	push   %ebp
801046e1:	89 e5                	mov    %esp,%ebp
801046e3:	53                   	push   %ebx
801046e4:	83 ec 04             	sub    $0x4,%esp
801046e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046ea:	e8 81 f0 ff ff       	call   80103770 <myproc>
801046ef:	8b 00                	mov    (%eax),%eax
801046f1:	39 d8                	cmp    %ebx,%eax
801046f3:	76 1b                	jbe    80104710 <fetchint+0x30>
801046f5:	8d 53 04             	lea    0x4(%ebx),%edx
801046f8:	39 d0                	cmp    %edx,%eax
801046fa:	72 14                	jb     80104710 <fetchint+0x30>
801046fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801046ff:	8b 13                	mov    (%ebx),%edx
80104701:	89 10                	mov    %edx,(%eax)
80104703:	31 c0                	xor    %eax,%eax
80104705:	83 c4 04             	add    $0x4,%esp
80104708:	5b                   	pop    %ebx
80104709:	5d                   	pop    %ebp
8010470a:	c3                   	ret    
8010470b:	90                   	nop
8010470c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104710:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104715:	eb ee                	jmp    80104705 <fetchint+0x25>
80104717:	89 f6                	mov    %esi,%esi
80104719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104720 <fetchstr>:
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	53                   	push   %ebx
80104724:	83 ec 04             	sub    $0x4,%esp
80104727:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010472a:	e8 41 f0 ff ff       	call   80103770 <myproc>
8010472f:	39 18                	cmp    %ebx,(%eax)
80104731:	76 29                	jbe    8010475c <fetchstr+0x3c>
80104733:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104736:	89 da                	mov    %ebx,%edx
80104738:	89 19                	mov    %ebx,(%ecx)
8010473a:	8b 00                	mov    (%eax),%eax
8010473c:	39 c3                	cmp    %eax,%ebx
8010473e:	73 1c                	jae    8010475c <fetchstr+0x3c>
80104740:	80 3b 00             	cmpb   $0x0,(%ebx)
80104743:	75 10                	jne    80104755 <fetchstr+0x35>
80104745:	eb 29                	jmp    80104770 <fetchstr+0x50>
80104747:	89 f6                	mov    %esi,%esi
80104749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104750:	80 3a 00             	cmpb   $0x0,(%edx)
80104753:	74 1b                	je     80104770 <fetchstr+0x50>
80104755:	83 c2 01             	add    $0x1,%edx
80104758:	39 d0                	cmp    %edx,%eax
8010475a:	77 f4                	ja     80104750 <fetchstr+0x30>
8010475c:	83 c4 04             	add    $0x4,%esp
8010475f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104764:	5b                   	pop    %ebx
80104765:	5d                   	pop    %ebp
80104766:	c3                   	ret    
80104767:	89 f6                	mov    %esi,%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104770:	83 c4 04             	add    $0x4,%esp
80104773:	89 d0                	mov    %edx,%eax
80104775:	29 d8                	sub    %ebx,%eax
80104777:	5b                   	pop    %ebx
80104778:	5d                   	pop    %ebp
80104779:	c3                   	ret    
8010477a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104780 <argint>:
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	e8 e6 ef ff ff       	call   80103770 <myproc>
8010478a:	8b 40 18             	mov    0x18(%eax),%eax
8010478d:	8b 55 08             	mov    0x8(%ebp),%edx
80104790:	8b 40 44             	mov    0x44(%eax),%eax
80104793:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104796:	e8 d5 ef ff ff       	call   80103770 <myproc>
8010479b:	8b 00                	mov    (%eax),%eax
8010479d:	8d 73 04             	lea    0x4(%ebx),%esi
801047a0:	39 c6                	cmp    %eax,%esi
801047a2:	73 1c                	jae    801047c0 <argint+0x40>
801047a4:	8d 53 08             	lea    0x8(%ebx),%edx
801047a7:	39 d0                	cmp    %edx,%eax
801047a9:	72 15                	jb     801047c0 <argint+0x40>
801047ab:	8b 45 0c             	mov    0xc(%ebp),%eax
801047ae:	8b 53 04             	mov    0x4(%ebx),%edx
801047b1:	89 10                	mov    %edx,(%eax)
801047b3:	31 c0                	xor    %eax,%eax
801047b5:	5b                   	pop    %ebx
801047b6:	5e                   	pop    %esi
801047b7:	5d                   	pop    %ebp
801047b8:	c3                   	ret    
801047b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801047c5:	eb ee                	jmp    801047b5 <argint+0x35>
801047c7:	89 f6                	mov    %esi,%esi
801047c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047d0 <argptr>:
801047d0:	55                   	push   %ebp
801047d1:	89 e5                	mov    %esp,%ebp
801047d3:	56                   	push   %esi
801047d4:	53                   	push   %ebx
801047d5:	83 ec 10             	sub    $0x10,%esp
801047d8:	8b 5d 10             	mov    0x10(%ebp),%ebx
801047db:	e8 90 ef ff ff       	call   80103770 <myproc>
801047e0:	89 c6                	mov    %eax,%esi
801047e2:	8d 45 f4             	lea    -0xc(%ebp),%eax
801047e5:	83 ec 08             	sub    $0x8,%esp
801047e8:	50                   	push   %eax
801047e9:	ff 75 08             	pushl  0x8(%ebp)
801047ec:	e8 8f ff ff ff       	call   80104780 <argint>
801047f1:	c1 e8 1f             	shr    $0x1f,%eax
801047f4:	83 c4 10             	add    $0x10,%esp
801047f7:	84 c0                	test   %al,%al
801047f9:	75 2d                	jne    80104828 <argptr+0x58>
801047fb:	89 d8                	mov    %ebx,%eax
801047fd:	c1 e8 1f             	shr    $0x1f,%eax
80104800:	84 c0                	test   %al,%al
80104802:	75 24                	jne    80104828 <argptr+0x58>
80104804:	8b 16                	mov    (%esi),%edx
80104806:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104809:	39 c2                	cmp    %eax,%edx
8010480b:	76 1b                	jbe    80104828 <argptr+0x58>
8010480d:	01 c3                	add    %eax,%ebx
8010480f:	39 da                	cmp    %ebx,%edx
80104811:	72 15                	jb     80104828 <argptr+0x58>
80104813:	8b 55 0c             	mov    0xc(%ebp),%edx
80104816:	89 02                	mov    %eax,(%edx)
80104818:	31 c0                	xor    %eax,%eax
8010481a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010481d:	5b                   	pop    %ebx
8010481e:	5e                   	pop    %esi
8010481f:	5d                   	pop    %ebp
80104820:	c3                   	ret    
80104821:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104828:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010482d:	eb eb                	jmp    8010481a <argptr+0x4a>
8010482f:	90                   	nop

80104830 <argstr>:
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	83 ec 20             	sub    $0x20,%esp
80104836:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104839:	50                   	push   %eax
8010483a:	ff 75 08             	pushl  0x8(%ebp)
8010483d:	e8 3e ff ff ff       	call   80104780 <argint>
80104842:	83 c4 10             	add    $0x10,%esp
80104845:	85 c0                	test   %eax,%eax
80104847:	78 17                	js     80104860 <argstr+0x30>
80104849:	83 ec 08             	sub    $0x8,%esp
8010484c:	ff 75 0c             	pushl  0xc(%ebp)
8010484f:	ff 75 f4             	pushl  -0xc(%ebp)
80104852:	e8 c9 fe ff ff       	call   80104720 <fetchstr>
80104857:	83 c4 10             	add    $0x10,%esp
8010485a:	c9                   	leave  
8010485b:	c3                   	ret    
8010485c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104860:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104865:	c9                   	leave  
80104866:	c3                   	ret    
80104867:	89 f6                	mov    %esi,%esi
80104869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104870 <syscall>:
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	56                   	push   %esi
80104874:	53                   	push   %ebx
80104875:	e8 f6 ee ff ff       	call   80103770 <myproc>
8010487a:	8b 70 18             	mov    0x18(%eax),%esi
8010487d:	89 c3                	mov    %eax,%ebx
8010487f:	8b 46 1c             	mov    0x1c(%esi),%eax
80104882:	8d 50 ff             	lea    -0x1(%eax),%edx
80104885:	83 fa 15             	cmp    $0x15,%edx
80104888:	77 1e                	ja     801048a8 <syscall+0x38>
8010488a:	8b 14 85 40 76 10 80 	mov    -0x7fef89c0(,%eax,4),%edx
80104891:	85 d2                	test   %edx,%edx
80104893:	74 13                	je     801048a8 <syscall+0x38>
80104895:	ff d2                	call   *%edx
80104897:	89 46 1c             	mov    %eax,0x1c(%esi)
8010489a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010489d:	5b                   	pop    %ebx
8010489e:	5e                   	pop    %esi
8010489f:	5d                   	pop    %ebp
801048a0:	c3                   	ret    
801048a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801048a8:	50                   	push   %eax
801048a9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801048ac:	50                   	push   %eax
801048ad:	ff 73 10             	pushl  0x10(%ebx)
801048b0:	68 05 76 10 80       	push   $0x80107605
801048b5:	e8 a6 bd ff ff       	call   80100660 <cprintf>
801048ba:	8b 43 18             	mov    0x18(%ebx),%eax
801048bd:	83 c4 10             	add    $0x10,%esp
801048c0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
801048c7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048ca:	5b                   	pop    %ebx
801048cb:	5e                   	pop    %esi
801048cc:	5d                   	pop    %ebp
801048cd:	c3                   	ret    
801048ce:	66 90                	xchg   %ax,%ax

801048d0 <create>:
801048d0:	55                   	push   %ebp
801048d1:	89 e5                	mov    %esp,%ebp
801048d3:	57                   	push   %edi
801048d4:	56                   	push   %esi
801048d5:	53                   	push   %ebx
801048d6:	8d 75 da             	lea    -0x26(%ebp),%esi
801048d9:	83 ec 34             	sub    $0x34,%esp
801048dc:	89 4d d0             	mov    %ecx,-0x30(%ebp)
801048df:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048e2:	56                   	push   %esi
801048e3:	50                   	push   %eax
801048e4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
801048e7:	89 4d cc             	mov    %ecx,-0x34(%ebp)
801048ea:	e8 e1 d5 ff ff       	call   80101ed0 <nameiparent>
801048ef:	83 c4 10             	add    $0x10,%esp
801048f2:	85 c0                	test   %eax,%eax
801048f4:	0f 84 f6 00 00 00    	je     801049f0 <create+0x120>
801048fa:	83 ec 0c             	sub    $0xc,%esp
801048fd:	89 c7                	mov    %eax,%edi
801048ff:	50                   	push   %eax
80104900:	e8 5b cd ff ff       	call   80101660 <ilock>
80104905:	83 c4 0c             	add    $0xc,%esp
80104908:	6a 00                	push   $0x0
8010490a:	56                   	push   %esi
8010490b:	57                   	push   %edi
8010490c:	e8 7f d2 ff ff       	call   80101b90 <dirlookup>
80104911:	83 c4 10             	add    $0x10,%esp
80104914:	85 c0                	test   %eax,%eax
80104916:	89 c3                	mov    %eax,%ebx
80104918:	74 56                	je     80104970 <create+0xa0>
8010491a:	83 ec 0c             	sub    $0xc,%esp
8010491d:	57                   	push   %edi
8010491e:	e8 cd cf ff ff       	call   801018f0 <iunlockput>
80104923:	89 1c 24             	mov    %ebx,(%esp)
80104926:	e8 35 cd ff ff       	call   80101660 <ilock>
8010492b:	83 c4 10             	add    $0x10,%esp
8010492e:	66 83 7d d4 02       	cmpw   $0x2,-0x2c(%ebp)
80104933:	75 1b                	jne    80104950 <create+0x80>
80104935:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010493a:	89 d8                	mov    %ebx,%eax
8010493c:	75 12                	jne    80104950 <create+0x80>
8010493e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104941:	5b                   	pop    %ebx
80104942:	5e                   	pop    %esi
80104943:	5f                   	pop    %edi
80104944:	5d                   	pop    %ebp
80104945:	c3                   	ret    
80104946:	8d 76 00             	lea    0x0(%esi),%esi
80104949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104950:	83 ec 0c             	sub    $0xc,%esp
80104953:	53                   	push   %ebx
80104954:	e8 97 cf ff ff       	call   801018f0 <iunlockput>
80104959:	83 c4 10             	add    $0x10,%esp
8010495c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010495f:	31 c0                	xor    %eax,%eax
80104961:	5b                   	pop    %ebx
80104962:	5e                   	pop    %esi
80104963:	5f                   	pop    %edi
80104964:	5d                   	pop    %ebp
80104965:	c3                   	ret    
80104966:	8d 76 00             	lea    0x0(%esi),%esi
80104969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104970:	0f bf 45 d4          	movswl -0x2c(%ebp),%eax
80104974:	83 ec 08             	sub    $0x8,%esp
80104977:	50                   	push   %eax
80104978:	ff 37                	pushl  (%edi)
8010497a:	e8 71 cb ff ff       	call   801014f0 <ialloc>
8010497f:	83 c4 10             	add    $0x10,%esp
80104982:	85 c0                	test   %eax,%eax
80104984:	89 c3                	mov    %eax,%ebx
80104986:	0f 84 cc 00 00 00    	je     80104a58 <create+0x188>
8010498c:	83 ec 0c             	sub    $0xc,%esp
8010498f:	50                   	push   %eax
80104990:	e8 cb cc ff ff       	call   80101660 <ilock>
80104995:	0f b7 45 d0          	movzwl -0x30(%ebp),%eax
80104999:	66 89 43 52          	mov    %ax,0x52(%ebx)
8010499d:	0f b7 45 cc          	movzwl -0x34(%ebp),%eax
801049a1:	66 89 43 54          	mov    %ax,0x54(%ebx)
801049a5:	b8 01 00 00 00       	mov    $0x1,%eax
801049aa:	66 89 43 56          	mov    %ax,0x56(%ebx)
801049ae:	89 1c 24             	mov    %ebx,(%esp)
801049b1:	e8 fa cb ff ff       	call   801015b0 <iupdate>
801049b6:	83 c4 10             	add    $0x10,%esp
801049b9:	66 83 7d d4 01       	cmpw   $0x1,-0x2c(%ebp)
801049be:	74 40                	je     80104a00 <create+0x130>
801049c0:	83 ec 04             	sub    $0x4,%esp
801049c3:	ff 73 04             	pushl  0x4(%ebx)
801049c6:	56                   	push   %esi
801049c7:	57                   	push   %edi
801049c8:	e8 23 d4 ff ff       	call   80101df0 <dirlink>
801049cd:	83 c4 10             	add    $0x10,%esp
801049d0:	85 c0                	test   %eax,%eax
801049d2:	78 77                	js     80104a4b <create+0x17b>
801049d4:	83 ec 0c             	sub    $0xc,%esp
801049d7:	57                   	push   %edi
801049d8:	e8 13 cf ff ff       	call   801018f0 <iunlockput>
801049dd:	83 c4 10             	add    $0x10,%esp
801049e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049e3:	89 d8                	mov    %ebx,%eax
801049e5:	5b                   	pop    %ebx
801049e6:	5e                   	pop    %esi
801049e7:	5f                   	pop    %edi
801049e8:	5d                   	pop    %ebp
801049e9:	c3                   	ret    
801049ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801049f0:	31 c0                	xor    %eax,%eax
801049f2:	e9 47 ff ff ff       	jmp    8010493e <create+0x6e>
801049f7:	89 f6                	mov    %esi,%esi
801049f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a00:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
80104a05:	83 ec 0c             	sub    $0xc,%esp
80104a08:	57                   	push   %edi
80104a09:	e8 a2 cb ff ff       	call   801015b0 <iupdate>
80104a0e:	83 c4 0c             	add    $0xc,%esp
80104a11:	ff 73 04             	pushl  0x4(%ebx)
80104a14:	68 b8 76 10 80       	push   $0x801076b8
80104a19:	53                   	push   %ebx
80104a1a:	e8 d1 d3 ff ff       	call   80101df0 <dirlink>
80104a1f:	83 c4 10             	add    $0x10,%esp
80104a22:	85 c0                	test   %eax,%eax
80104a24:	78 18                	js     80104a3e <create+0x16e>
80104a26:	83 ec 04             	sub    $0x4,%esp
80104a29:	ff 77 04             	pushl  0x4(%edi)
80104a2c:	68 b7 76 10 80       	push   $0x801076b7
80104a31:	53                   	push   %ebx
80104a32:	e8 b9 d3 ff ff       	call   80101df0 <dirlink>
80104a37:	83 c4 10             	add    $0x10,%esp
80104a3a:	85 c0                	test   %eax,%eax
80104a3c:	79 82                	jns    801049c0 <create+0xf0>
80104a3e:	83 ec 0c             	sub    $0xc,%esp
80104a41:	68 ab 76 10 80       	push   $0x801076ab
80104a46:	e8 25 b9 ff ff       	call   80100370 <panic>
80104a4b:	83 ec 0c             	sub    $0xc,%esp
80104a4e:	68 ba 76 10 80       	push   $0x801076ba
80104a53:	e8 18 b9 ff ff       	call   80100370 <panic>
80104a58:	83 ec 0c             	sub    $0xc,%esp
80104a5b:	68 9c 76 10 80       	push   $0x8010769c
80104a60:	e8 0b b9 ff ff       	call   80100370 <panic>
80104a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a70 <argfd.constprop.0>:
80104a70:	55                   	push   %ebp
80104a71:	89 e5                	mov    %esp,%ebp
80104a73:	56                   	push   %esi
80104a74:	53                   	push   %ebx
80104a75:	89 c6                	mov    %eax,%esi
80104a77:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104a7a:	89 d3                	mov    %edx,%ebx
80104a7c:	83 ec 18             	sub    $0x18,%esp
80104a7f:	50                   	push   %eax
80104a80:	6a 00                	push   $0x0
80104a82:	e8 f9 fc ff ff       	call   80104780 <argint>
80104a87:	83 c4 10             	add    $0x10,%esp
80104a8a:	85 c0                	test   %eax,%eax
80104a8c:	78 32                	js     80104ac0 <argfd.constprop.0+0x50>
80104a8e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104a92:	77 2c                	ja     80104ac0 <argfd.constprop.0+0x50>
80104a94:	e8 d7 ec ff ff       	call   80103770 <myproc>
80104a99:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104a9c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104aa0:	85 c0                	test   %eax,%eax
80104aa2:	74 1c                	je     80104ac0 <argfd.constprop.0+0x50>
80104aa4:	85 f6                	test   %esi,%esi
80104aa6:	74 02                	je     80104aaa <argfd.constprop.0+0x3a>
80104aa8:	89 16                	mov    %edx,(%esi)
80104aaa:	85 db                	test   %ebx,%ebx
80104aac:	74 22                	je     80104ad0 <argfd.constprop.0+0x60>
80104aae:	89 03                	mov    %eax,(%ebx)
80104ab0:	31 c0                	xor    %eax,%eax
80104ab2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ab5:	5b                   	pop    %ebx
80104ab6:	5e                   	pop    %esi
80104ab7:	5d                   	pop    %ebp
80104ab8:	c3                   	ret    
80104ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ac0:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104ac3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ac8:	5b                   	pop    %ebx
80104ac9:	5e                   	pop    %esi
80104aca:	5d                   	pop    %ebp
80104acb:	c3                   	ret    
80104acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ad0:	31 c0                	xor    %eax,%eax
80104ad2:	eb de                	jmp    80104ab2 <argfd.constprop.0+0x42>
80104ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104ae0 <sys_dup>:
80104ae0:	55                   	push   %ebp
80104ae1:	31 c0                	xor    %eax,%eax
80104ae3:	89 e5                	mov    %esp,%ebp
80104ae5:	56                   	push   %esi
80104ae6:	53                   	push   %ebx
80104ae7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104aea:	83 ec 10             	sub    $0x10,%esp
80104aed:	e8 7e ff ff ff       	call   80104a70 <argfd.constprop.0>
80104af2:	85 c0                	test   %eax,%eax
80104af4:	78 1a                	js     80104b10 <sys_dup+0x30>
80104af6:	31 db                	xor    %ebx,%ebx
80104af8:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104afb:	e8 70 ec ff ff       	call   80103770 <myproc>
80104b00:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104b04:	85 d2                	test   %edx,%edx
80104b06:	74 18                	je     80104b20 <sys_dup+0x40>
80104b08:	83 c3 01             	add    $0x1,%ebx
80104b0b:	83 fb 10             	cmp    $0x10,%ebx
80104b0e:	75 f0                	jne    80104b00 <sys_dup+0x20>
80104b10:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b13:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b18:	5b                   	pop    %ebx
80104b19:	5e                   	pop    %esi
80104b1a:	5d                   	pop    %ebp
80104b1b:	c3                   	ret    
80104b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b20:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104b24:	83 ec 0c             	sub    $0xc,%esp
80104b27:	ff 75 f4             	pushl  -0xc(%ebp)
80104b2a:	e8 b1 c2 ff ff       	call   80100de0 <filedup>
80104b2f:	83 c4 10             	add    $0x10,%esp
80104b32:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b35:	89 d8                	mov    %ebx,%eax
80104b37:	5b                   	pop    %ebx
80104b38:	5e                   	pop    %esi
80104b39:	5d                   	pop    %ebp
80104b3a:	c3                   	ret    
80104b3b:	90                   	nop
80104b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b40 <sys_read>:
80104b40:	55                   	push   %ebp
80104b41:	31 c0                	xor    %eax,%eax
80104b43:	89 e5                	mov    %esp,%ebp
80104b45:	83 ec 18             	sub    $0x18,%esp
80104b48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b4b:	e8 20 ff ff ff       	call   80104a70 <argfd.constprop.0>
80104b50:	85 c0                	test   %eax,%eax
80104b52:	78 4c                	js     80104ba0 <sys_read+0x60>
80104b54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b57:	83 ec 08             	sub    $0x8,%esp
80104b5a:	50                   	push   %eax
80104b5b:	6a 02                	push   $0x2
80104b5d:	e8 1e fc ff ff       	call   80104780 <argint>
80104b62:	83 c4 10             	add    $0x10,%esp
80104b65:	85 c0                	test   %eax,%eax
80104b67:	78 37                	js     80104ba0 <sys_read+0x60>
80104b69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b6c:	83 ec 04             	sub    $0x4,%esp
80104b6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104b72:	50                   	push   %eax
80104b73:	6a 01                	push   $0x1
80104b75:	e8 56 fc ff ff       	call   801047d0 <argptr>
80104b7a:	83 c4 10             	add    $0x10,%esp
80104b7d:	85 c0                	test   %eax,%eax
80104b7f:	78 1f                	js     80104ba0 <sys_read+0x60>
80104b81:	83 ec 04             	sub    $0x4,%esp
80104b84:	ff 75 f0             	pushl  -0x10(%ebp)
80104b87:	ff 75 f4             	pushl  -0xc(%ebp)
80104b8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104b8d:	e8 be c3 ff ff       	call   80100f50 <fileread>
80104b92:	83 c4 10             	add    $0x10,%esp
80104b95:	c9                   	leave  
80104b96:	c3                   	ret    
80104b97:	89 f6                	mov    %esi,%esi
80104b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ba0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ba5:	c9                   	leave  
80104ba6:	c3                   	ret    
80104ba7:	89 f6                	mov    %esi,%esi
80104ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bb0 <sys_write>:
80104bb0:	55                   	push   %ebp
80104bb1:	31 c0                	xor    %eax,%eax
80104bb3:	89 e5                	mov    %esp,%ebp
80104bb5:	83 ec 18             	sub    $0x18,%esp
80104bb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104bbb:	e8 b0 fe ff ff       	call   80104a70 <argfd.constprop.0>
80104bc0:	85 c0                	test   %eax,%eax
80104bc2:	78 4c                	js     80104c10 <sys_write+0x60>
80104bc4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104bc7:	83 ec 08             	sub    $0x8,%esp
80104bca:	50                   	push   %eax
80104bcb:	6a 02                	push   $0x2
80104bcd:	e8 ae fb ff ff       	call   80104780 <argint>
80104bd2:	83 c4 10             	add    $0x10,%esp
80104bd5:	85 c0                	test   %eax,%eax
80104bd7:	78 37                	js     80104c10 <sys_write+0x60>
80104bd9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bdc:	83 ec 04             	sub    $0x4,%esp
80104bdf:	ff 75 f0             	pushl  -0x10(%ebp)
80104be2:	50                   	push   %eax
80104be3:	6a 01                	push   $0x1
80104be5:	e8 e6 fb ff ff       	call   801047d0 <argptr>
80104bea:	83 c4 10             	add    $0x10,%esp
80104bed:	85 c0                	test   %eax,%eax
80104bef:	78 1f                	js     80104c10 <sys_write+0x60>
80104bf1:	83 ec 04             	sub    $0x4,%esp
80104bf4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bf7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bfa:	ff 75 ec             	pushl  -0x14(%ebp)
80104bfd:	e8 de c3 ff ff       	call   80100fe0 <filewrite>
80104c02:	83 c4 10             	add    $0x10,%esp
80104c05:	c9                   	leave  
80104c06:	c3                   	ret    
80104c07:	89 f6                	mov    %esi,%esi
80104c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c15:	c9                   	leave  
80104c16:	c3                   	ret    
80104c17:	89 f6                	mov    %esi,%esi
80104c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c20 <sys_close>:
80104c20:	55                   	push   %ebp
80104c21:	89 e5                	mov    %esp,%ebp
80104c23:	83 ec 18             	sub    $0x18,%esp
80104c26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c2c:	e8 3f fe ff ff       	call   80104a70 <argfd.constprop.0>
80104c31:	85 c0                	test   %eax,%eax
80104c33:	78 2b                	js     80104c60 <sys_close+0x40>
80104c35:	e8 36 eb ff ff       	call   80103770 <myproc>
80104c3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104c3d:	83 ec 0c             	sub    $0xc,%esp
80104c40:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c47:	00 
80104c48:	ff 75 f4             	pushl  -0xc(%ebp)
80104c4b:	e8 e0 c1 ff ff       	call   80100e30 <fileclose>
80104c50:	83 c4 10             	add    $0x10,%esp
80104c53:	31 c0                	xor    %eax,%eax
80104c55:	c9                   	leave  
80104c56:	c3                   	ret    
80104c57:	89 f6                	mov    %esi,%esi
80104c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104c60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104c65:	c9                   	leave  
80104c66:	c3                   	ret    
80104c67:	89 f6                	mov    %esi,%esi
80104c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c70 <sys_fstat>:
80104c70:	55                   	push   %ebp
80104c71:	31 c0                	xor    %eax,%eax
80104c73:	89 e5                	mov    %esp,%ebp
80104c75:	83 ec 18             	sub    $0x18,%esp
80104c78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104c7b:	e8 f0 fd ff ff       	call   80104a70 <argfd.constprop.0>
80104c80:	85 c0                	test   %eax,%eax
80104c82:	78 2c                	js     80104cb0 <sys_fstat+0x40>
80104c84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c87:	83 ec 04             	sub    $0x4,%esp
80104c8a:	6a 14                	push   $0x14
80104c8c:	50                   	push   %eax
80104c8d:	6a 01                	push   $0x1
80104c8f:	e8 3c fb ff ff       	call   801047d0 <argptr>
80104c94:	83 c4 10             	add    $0x10,%esp
80104c97:	85 c0                	test   %eax,%eax
80104c99:	78 15                	js     80104cb0 <sys_fstat+0x40>
80104c9b:	83 ec 08             	sub    $0x8,%esp
80104c9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104ca1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ca4:	e8 57 c2 ff ff       	call   80100f00 <filestat>
80104ca9:	83 c4 10             	add    $0x10,%esp
80104cac:	c9                   	leave  
80104cad:	c3                   	ret    
80104cae:	66 90                	xchg   %ax,%ax
80104cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cb5:	c9                   	leave  
80104cb6:	c3                   	ret    
80104cb7:	89 f6                	mov    %esi,%esi
80104cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cc0 <sys_link>:
80104cc0:	55                   	push   %ebp
80104cc1:	89 e5                	mov    %esp,%ebp
80104cc3:	57                   	push   %edi
80104cc4:	56                   	push   %esi
80104cc5:	53                   	push   %ebx
80104cc6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104cc9:	83 ec 34             	sub    $0x34,%esp
80104ccc:	50                   	push   %eax
80104ccd:	6a 00                	push   $0x0
80104ccf:	e8 5c fb ff ff       	call   80104830 <argstr>
80104cd4:	83 c4 10             	add    $0x10,%esp
80104cd7:	85 c0                	test   %eax,%eax
80104cd9:	0f 88 fb 00 00 00    	js     80104dda <sys_link+0x11a>
80104cdf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104ce2:	83 ec 08             	sub    $0x8,%esp
80104ce5:	50                   	push   %eax
80104ce6:	6a 01                	push   $0x1
80104ce8:	e8 43 fb ff ff       	call   80104830 <argstr>
80104ced:	83 c4 10             	add    $0x10,%esp
80104cf0:	85 c0                	test   %eax,%eax
80104cf2:	0f 88 e2 00 00 00    	js     80104dda <sys_link+0x11a>
80104cf8:	e8 43 de ff ff       	call   80102b40 <begin_op>
80104cfd:	83 ec 0c             	sub    $0xc,%esp
80104d00:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d03:	e8 a8 d1 ff ff       	call   80101eb0 <namei>
80104d08:	83 c4 10             	add    $0x10,%esp
80104d0b:	85 c0                	test   %eax,%eax
80104d0d:	89 c3                	mov    %eax,%ebx
80104d0f:	0f 84 f3 00 00 00    	je     80104e08 <sys_link+0x148>
80104d15:	83 ec 0c             	sub    $0xc,%esp
80104d18:	50                   	push   %eax
80104d19:	e8 42 c9 ff ff       	call   80101660 <ilock>
80104d1e:	83 c4 10             	add    $0x10,%esp
80104d21:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d26:	0f 84 c4 00 00 00    	je     80104df0 <sys_link+0x130>
80104d2c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104d31:	83 ec 0c             	sub    $0xc,%esp
80104d34:	8d 7d da             	lea    -0x26(%ebp),%edi
80104d37:	53                   	push   %ebx
80104d38:	e8 73 c8 ff ff       	call   801015b0 <iupdate>
80104d3d:	89 1c 24             	mov    %ebx,(%esp)
80104d40:	e8 fb c9 ff ff       	call   80101740 <iunlock>
80104d45:	58                   	pop    %eax
80104d46:	5a                   	pop    %edx
80104d47:	57                   	push   %edi
80104d48:	ff 75 d0             	pushl  -0x30(%ebp)
80104d4b:	e8 80 d1 ff ff       	call   80101ed0 <nameiparent>
80104d50:	83 c4 10             	add    $0x10,%esp
80104d53:	85 c0                	test   %eax,%eax
80104d55:	89 c6                	mov    %eax,%esi
80104d57:	74 5b                	je     80104db4 <sys_link+0xf4>
80104d59:	83 ec 0c             	sub    $0xc,%esp
80104d5c:	50                   	push   %eax
80104d5d:	e8 fe c8 ff ff       	call   80101660 <ilock>
80104d62:	83 c4 10             	add    $0x10,%esp
80104d65:	8b 03                	mov    (%ebx),%eax
80104d67:	39 06                	cmp    %eax,(%esi)
80104d69:	75 3d                	jne    80104da8 <sys_link+0xe8>
80104d6b:	83 ec 04             	sub    $0x4,%esp
80104d6e:	ff 73 04             	pushl  0x4(%ebx)
80104d71:	57                   	push   %edi
80104d72:	56                   	push   %esi
80104d73:	e8 78 d0 ff ff       	call   80101df0 <dirlink>
80104d78:	83 c4 10             	add    $0x10,%esp
80104d7b:	85 c0                	test   %eax,%eax
80104d7d:	78 29                	js     80104da8 <sys_link+0xe8>
80104d7f:	83 ec 0c             	sub    $0xc,%esp
80104d82:	56                   	push   %esi
80104d83:	e8 68 cb ff ff       	call   801018f0 <iunlockput>
80104d88:	89 1c 24             	mov    %ebx,(%esp)
80104d8b:	e8 00 ca ff ff       	call   80101790 <iput>
80104d90:	e8 1b de ff ff       	call   80102bb0 <end_op>
80104d95:	83 c4 10             	add    $0x10,%esp
80104d98:	31 c0                	xor    %eax,%eax
80104d9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104d9d:	5b                   	pop    %ebx
80104d9e:	5e                   	pop    %esi
80104d9f:	5f                   	pop    %edi
80104da0:	5d                   	pop    %ebp
80104da1:	c3                   	ret    
80104da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104da8:	83 ec 0c             	sub    $0xc,%esp
80104dab:	56                   	push   %esi
80104dac:	e8 3f cb ff ff       	call   801018f0 <iunlockput>
80104db1:	83 c4 10             	add    $0x10,%esp
80104db4:	83 ec 0c             	sub    $0xc,%esp
80104db7:	53                   	push   %ebx
80104db8:	e8 a3 c8 ff ff       	call   80101660 <ilock>
80104dbd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104dc2:	89 1c 24             	mov    %ebx,(%esp)
80104dc5:	e8 e6 c7 ff ff       	call   801015b0 <iupdate>
80104dca:	89 1c 24             	mov    %ebx,(%esp)
80104dcd:	e8 1e cb ff ff       	call   801018f0 <iunlockput>
80104dd2:	e8 d9 dd ff ff       	call   80102bb0 <end_op>
80104dd7:	83 c4 10             	add    $0x10,%esp
80104dda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ddd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104de2:	5b                   	pop    %ebx
80104de3:	5e                   	pop    %esi
80104de4:	5f                   	pop    %edi
80104de5:	5d                   	pop    %ebp
80104de6:	c3                   	ret    
80104de7:	89 f6                	mov    %esi,%esi
80104de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104df0:	83 ec 0c             	sub    $0xc,%esp
80104df3:	53                   	push   %ebx
80104df4:	e8 f7 ca ff ff       	call   801018f0 <iunlockput>
80104df9:	e8 b2 dd ff ff       	call   80102bb0 <end_op>
80104dfe:	83 c4 10             	add    $0x10,%esp
80104e01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e06:	eb 92                	jmp    80104d9a <sys_link+0xda>
80104e08:	e8 a3 dd ff ff       	call   80102bb0 <end_op>
80104e0d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e12:	eb 86                	jmp    80104d9a <sys_link+0xda>
80104e14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e20 <sys_unlink>:
80104e20:	55                   	push   %ebp
80104e21:	89 e5                	mov    %esp,%ebp
80104e23:	57                   	push   %edi
80104e24:	56                   	push   %esi
80104e25:	53                   	push   %ebx
80104e26:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104e29:	83 ec 54             	sub    $0x54,%esp
80104e2c:	50                   	push   %eax
80104e2d:	6a 00                	push   $0x0
80104e2f:	e8 fc f9 ff ff       	call   80104830 <argstr>
80104e34:	83 c4 10             	add    $0x10,%esp
80104e37:	85 c0                	test   %eax,%eax
80104e39:	0f 88 82 01 00 00    	js     80104fc1 <sys_unlink+0x1a1>
80104e3f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104e42:	e8 f9 dc ff ff       	call   80102b40 <begin_op>
80104e47:	83 ec 08             	sub    $0x8,%esp
80104e4a:	53                   	push   %ebx
80104e4b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e4e:	e8 7d d0 ff ff       	call   80101ed0 <nameiparent>
80104e53:	83 c4 10             	add    $0x10,%esp
80104e56:	85 c0                	test   %eax,%eax
80104e58:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e5b:	0f 84 6a 01 00 00    	je     80104fcb <sys_unlink+0x1ab>
80104e61:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104e64:	83 ec 0c             	sub    $0xc,%esp
80104e67:	56                   	push   %esi
80104e68:	e8 f3 c7 ff ff       	call   80101660 <ilock>
80104e6d:	58                   	pop    %eax
80104e6e:	5a                   	pop    %edx
80104e6f:	68 b8 76 10 80       	push   $0x801076b8
80104e74:	53                   	push   %ebx
80104e75:	e8 f6 cc ff ff       	call   80101b70 <namecmp>
80104e7a:	83 c4 10             	add    $0x10,%esp
80104e7d:	85 c0                	test   %eax,%eax
80104e7f:	0f 84 fc 00 00 00    	je     80104f81 <sys_unlink+0x161>
80104e85:	83 ec 08             	sub    $0x8,%esp
80104e88:	68 b7 76 10 80       	push   $0x801076b7
80104e8d:	53                   	push   %ebx
80104e8e:	e8 dd cc ff ff       	call   80101b70 <namecmp>
80104e93:	83 c4 10             	add    $0x10,%esp
80104e96:	85 c0                	test   %eax,%eax
80104e98:	0f 84 e3 00 00 00    	je     80104f81 <sys_unlink+0x161>
80104e9e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ea1:	83 ec 04             	sub    $0x4,%esp
80104ea4:	50                   	push   %eax
80104ea5:	53                   	push   %ebx
80104ea6:	56                   	push   %esi
80104ea7:	e8 e4 cc ff ff       	call   80101b90 <dirlookup>
80104eac:	83 c4 10             	add    $0x10,%esp
80104eaf:	85 c0                	test   %eax,%eax
80104eb1:	89 c3                	mov    %eax,%ebx
80104eb3:	0f 84 c8 00 00 00    	je     80104f81 <sys_unlink+0x161>
80104eb9:	83 ec 0c             	sub    $0xc,%esp
80104ebc:	50                   	push   %eax
80104ebd:	e8 9e c7 ff ff       	call   80101660 <ilock>
80104ec2:	83 c4 10             	add    $0x10,%esp
80104ec5:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104eca:	0f 8e 24 01 00 00    	jle    80104ff4 <sys_unlink+0x1d4>
80104ed0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104ed5:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104ed8:	74 66                	je     80104f40 <sys_unlink+0x120>
80104eda:	83 ec 04             	sub    $0x4,%esp
80104edd:	6a 10                	push   $0x10
80104edf:	6a 00                	push   $0x0
80104ee1:	56                   	push   %esi
80104ee2:	e8 89 f5 ff ff       	call   80104470 <memset>
80104ee7:	6a 10                	push   $0x10
80104ee9:	ff 75 c4             	pushl  -0x3c(%ebp)
80104eec:	56                   	push   %esi
80104eed:	ff 75 b4             	pushl  -0x4c(%ebp)
80104ef0:	e8 4b cb ff ff       	call   80101a40 <writei>
80104ef5:	83 c4 20             	add    $0x20,%esp
80104ef8:	83 f8 10             	cmp    $0x10,%eax
80104efb:	0f 85 e6 00 00 00    	jne    80104fe7 <sys_unlink+0x1c7>
80104f01:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f06:	0f 84 9c 00 00 00    	je     80104fa8 <sys_unlink+0x188>
80104f0c:	83 ec 0c             	sub    $0xc,%esp
80104f0f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f12:	e8 d9 c9 ff ff       	call   801018f0 <iunlockput>
80104f17:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104f1c:	89 1c 24             	mov    %ebx,(%esp)
80104f1f:	e8 8c c6 ff ff       	call   801015b0 <iupdate>
80104f24:	89 1c 24             	mov    %ebx,(%esp)
80104f27:	e8 c4 c9 ff ff       	call   801018f0 <iunlockput>
80104f2c:	e8 7f dc ff ff       	call   80102bb0 <end_op>
80104f31:	83 c4 10             	add    $0x10,%esp
80104f34:	31 c0                	xor    %eax,%eax
80104f36:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f39:	5b                   	pop    %ebx
80104f3a:	5e                   	pop    %esi
80104f3b:	5f                   	pop    %edi
80104f3c:	5d                   	pop    %ebp
80104f3d:	c3                   	ret    
80104f3e:	66 90                	xchg   %ax,%ax
80104f40:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f44:	76 94                	jbe    80104eda <sys_unlink+0xba>
80104f46:	bf 20 00 00 00       	mov    $0x20,%edi
80104f4b:	eb 0f                	jmp    80104f5c <sys_unlink+0x13c>
80104f4d:	8d 76 00             	lea    0x0(%esi),%esi
80104f50:	83 c7 10             	add    $0x10,%edi
80104f53:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f56:	0f 83 7e ff ff ff    	jae    80104eda <sys_unlink+0xba>
80104f5c:	6a 10                	push   $0x10
80104f5e:	57                   	push   %edi
80104f5f:	56                   	push   %esi
80104f60:	53                   	push   %ebx
80104f61:	e8 da c9 ff ff       	call   80101940 <readi>
80104f66:	83 c4 10             	add    $0x10,%esp
80104f69:	83 f8 10             	cmp    $0x10,%eax
80104f6c:	75 6c                	jne    80104fda <sys_unlink+0x1ba>
80104f6e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104f73:	74 db                	je     80104f50 <sys_unlink+0x130>
80104f75:	83 ec 0c             	sub    $0xc,%esp
80104f78:	53                   	push   %ebx
80104f79:	e8 72 c9 ff ff       	call   801018f0 <iunlockput>
80104f7e:	83 c4 10             	add    $0x10,%esp
80104f81:	83 ec 0c             	sub    $0xc,%esp
80104f84:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f87:	e8 64 c9 ff ff       	call   801018f0 <iunlockput>
80104f8c:	e8 1f dc ff ff       	call   80102bb0 <end_op>
80104f91:	83 c4 10             	add    $0x10,%esp
80104f94:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f97:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f9c:	5b                   	pop    %ebx
80104f9d:	5e                   	pop    %esi
80104f9e:	5f                   	pop    %edi
80104f9f:	5d                   	pop    %ebp
80104fa0:	c3                   	ret    
80104fa1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104fa8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
80104fab:	83 ec 0c             	sub    $0xc,%esp
80104fae:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80104fb3:	50                   	push   %eax
80104fb4:	e8 f7 c5 ff ff       	call   801015b0 <iupdate>
80104fb9:	83 c4 10             	add    $0x10,%esp
80104fbc:	e9 4b ff ff ff       	jmp    80104f0c <sys_unlink+0xec>
80104fc1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fc6:	e9 6b ff ff ff       	jmp    80104f36 <sys_unlink+0x116>
80104fcb:	e8 e0 db ff ff       	call   80102bb0 <end_op>
80104fd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fd5:	e9 5c ff ff ff       	jmp    80104f36 <sys_unlink+0x116>
80104fda:	83 ec 0c             	sub    $0xc,%esp
80104fdd:	68 dc 76 10 80       	push   $0x801076dc
80104fe2:	e8 89 b3 ff ff       	call   80100370 <panic>
80104fe7:	83 ec 0c             	sub    $0xc,%esp
80104fea:	68 ee 76 10 80       	push   $0x801076ee
80104fef:	e8 7c b3 ff ff       	call   80100370 <panic>
80104ff4:	83 ec 0c             	sub    $0xc,%esp
80104ff7:	68 ca 76 10 80       	push   $0x801076ca
80104ffc:	e8 6f b3 ff ff       	call   80100370 <panic>
80105001:	eb 0d                	jmp    80105010 <sys_open>
80105003:	90                   	nop
80105004:	90                   	nop
80105005:	90                   	nop
80105006:	90                   	nop
80105007:	90                   	nop
80105008:	90                   	nop
80105009:	90                   	nop
8010500a:	90                   	nop
8010500b:	90                   	nop
8010500c:	90                   	nop
8010500d:	90                   	nop
8010500e:	90                   	nop
8010500f:	90                   	nop

80105010 <sys_open>:
80105010:	55                   	push   %ebp
80105011:	89 e5                	mov    %esp,%ebp
80105013:	57                   	push   %edi
80105014:	56                   	push   %esi
80105015:	53                   	push   %ebx
80105016:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105019:	83 ec 24             	sub    $0x24,%esp
8010501c:	50                   	push   %eax
8010501d:	6a 00                	push   $0x0
8010501f:	e8 0c f8 ff ff       	call   80104830 <argstr>
80105024:	83 c4 10             	add    $0x10,%esp
80105027:	85 c0                	test   %eax,%eax
80105029:	0f 88 9e 00 00 00    	js     801050cd <sys_open+0xbd>
8010502f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105032:	83 ec 08             	sub    $0x8,%esp
80105035:	50                   	push   %eax
80105036:	6a 01                	push   $0x1
80105038:	e8 43 f7 ff ff       	call   80104780 <argint>
8010503d:	83 c4 10             	add    $0x10,%esp
80105040:	85 c0                	test   %eax,%eax
80105042:	0f 88 85 00 00 00    	js     801050cd <sys_open+0xbd>
80105048:	e8 f3 da ff ff       	call   80102b40 <begin_op>
8010504d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105051:	0f 85 89 00 00 00    	jne    801050e0 <sys_open+0xd0>
80105057:	83 ec 0c             	sub    $0xc,%esp
8010505a:	ff 75 e0             	pushl  -0x20(%ebp)
8010505d:	e8 4e ce ff ff       	call   80101eb0 <namei>
80105062:	83 c4 10             	add    $0x10,%esp
80105065:	85 c0                	test   %eax,%eax
80105067:	89 c6                	mov    %eax,%esi
80105069:	0f 84 8e 00 00 00    	je     801050fd <sys_open+0xed>
8010506f:	83 ec 0c             	sub    $0xc,%esp
80105072:	50                   	push   %eax
80105073:	e8 e8 c5 ff ff       	call   80101660 <ilock>
80105078:	83 c4 10             	add    $0x10,%esp
8010507b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105080:	0f 84 d2 00 00 00    	je     80105158 <sys_open+0x148>
80105086:	e8 e5 bc ff ff       	call   80100d70 <filealloc>
8010508b:	85 c0                	test   %eax,%eax
8010508d:	89 c7                	mov    %eax,%edi
8010508f:	74 2b                	je     801050bc <sys_open+0xac>
80105091:	31 db                	xor    %ebx,%ebx
80105093:	e8 d8 e6 ff ff       	call   80103770 <myproc>
80105098:	90                   	nop
80105099:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801050a0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050a4:	85 d2                	test   %edx,%edx
801050a6:	74 68                	je     80105110 <sys_open+0x100>
801050a8:	83 c3 01             	add    $0x1,%ebx
801050ab:	83 fb 10             	cmp    $0x10,%ebx
801050ae:	75 f0                	jne    801050a0 <sys_open+0x90>
801050b0:	83 ec 0c             	sub    $0xc,%esp
801050b3:	57                   	push   %edi
801050b4:	e8 77 bd ff ff       	call   80100e30 <fileclose>
801050b9:	83 c4 10             	add    $0x10,%esp
801050bc:	83 ec 0c             	sub    $0xc,%esp
801050bf:	56                   	push   %esi
801050c0:	e8 2b c8 ff ff       	call   801018f0 <iunlockput>
801050c5:	e8 e6 da ff ff       	call   80102bb0 <end_op>
801050ca:	83 c4 10             	add    $0x10,%esp
801050cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050d5:	5b                   	pop    %ebx
801050d6:	5e                   	pop    %esi
801050d7:	5f                   	pop    %edi
801050d8:	5d                   	pop    %ebp
801050d9:	c3                   	ret    
801050da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050e0:	83 ec 0c             	sub    $0xc,%esp
801050e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801050e6:	31 c9                	xor    %ecx,%ecx
801050e8:	6a 00                	push   $0x0
801050ea:	ba 02 00 00 00       	mov    $0x2,%edx
801050ef:	e8 dc f7 ff ff       	call   801048d0 <create>
801050f4:	83 c4 10             	add    $0x10,%esp
801050f7:	85 c0                	test   %eax,%eax
801050f9:	89 c6                	mov    %eax,%esi
801050fb:	75 89                	jne    80105086 <sys_open+0x76>
801050fd:	e8 ae da ff ff       	call   80102bb0 <end_op>
80105102:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105107:	eb 43                	jmp    8010514c <sys_open+0x13c>
80105109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105110:	83 ec 0c             	sub    $0xc,%esp
80105113:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
80105117:	56                   	push   %esi
80105118:	e8 23 c6 ff ff       	call   80101740 <iunlock>
8010511d:	e8 8e da ff ff       	call   80102bb0 <end_op>
80105122:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
80105128:	8b 55 e4             	mov    -0x1c(%ebp),%edx
8010512b:	83 c4 10             	add    $0x10,%esp
8010512e:	89 77 10             	mov    %esi,0x10(%edi)
80105131:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
80105138:	89 d0                	mov    %edx,%eax
8010513a:	83 e0 01             	and    $0x1,%eax
8010513d:	83 f0 01             	xor    $0x1,%eax
80105140:	83 e2 03             	and    $0x3,%edx
80105143:	88 47 08             	mov    %al,0x8(%edi)
80105146:	0f 95 47 09          	setne  0x9(%edi)
8010514a:	89 d8                	mov    %ebx,%eax
8010514c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010514f:	5b                   	pop    %ebx
80105150:	5e                   	pop    %esi
80105151:	5f                   	pop    %edi
80105152:	5d                   	pop    %ebp
80105153:	c3                   	ret    
80105154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105158:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010515b:	85 c9                	test   %ecx,%ecx
8010515d:	0f 84 23 ff ff ff    	je     80105086 <sys_open+0x76>
80105163:	e9 54 ff ff ff       	jmp    801050bc <sys_open+0xac>
80105168:	90                   	nop
80105169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105170 <sys_mkdir>:
80105170:	55                   	push   %ebp
80105171:	89 e5                	mov    %esp,%ebp
80105173:	83 ec 18             	sub    $0x18,%esp
80105176:	e8 c5 d9 ff ff       	call   80102b40 <begin_op>
8010517b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010517e:	83 ec 08             	sub    $0x8,%esp
80105181:	50                   	push   %eax
80105182:	6a 00                	push   $0x0
80105184:	e8 a7 f6 ff ff       	call   80104830 <argstr>
80105189:	83 c4 10             	add    $0x10,%esp
8010518c:	85 c0                	test   %eax,%eax
8010518e:	78 30                	js     801051c0 <sys_mkdir+0x50>
80105190:	83 ec 0c             	sub    $0xc,%esp
80105193:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105196:	31 c9                	xor    %ecx,%ecx
80105198:	6a 00                	push   $0x0
8010519a:	ba 01 00 00 00       	mov    $0x1,%edx
8010519f:	e8 2c f7 ff ff       	call   801048d0 <create>
801051a4:	83 c4 10             	add    $0x10,%esp
801051a7:	85 c0                	test   %eax,%eax
801051a9:	74 15                	je     801051c0 <sys_mkdir+0x50>
801051ab:	83 ec 0c             	sub    $0xc,%esp
801051ae:	50                   	push   %eax
801051af:	e8 3c c7 ff ff       	call   801018f0 <iunlockput>
801051b4:	e8 f7 d9 ff ff       	call   80102bb0 <end_op>
801051b9:	83 c4 10             	add    $0x10,%esp
801051bc:	31 c0                	xor    %eax,%eax
801051be:	c9                   	leave  
801051bf:	c3                   	ret    
801051c0:	e8 eb d9 ff ff       	call   80102bb0 <end_op>
801051c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801051ca:	c9                   	leave  
801051cb:	c3                   	ret    
801051cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801051d0 <sys_mknod>:
801051d0:	55                   	push   %ebp
801051d1:	89 e5                	mov    %esp,%ebp
801051d3:	83 ec 18             	sub    $0x18,%esp
801051d6:	e8 65 d9 ff ff       	call   80102b40 <begin_op>
801051db:	8d 45 ec             	lea    -0x14(%ebp),%eax
801051de:	83 ec 08             	sub    $0x8,%esp
801051e1:	50                   	push   %eax
801051e2:	6a 00                	push   $0x0
801051e4:	e8 47 f6 ff ff       	call   80104830 <argstr>
801051e9:	83 c4 10             	add    $0x10,%esp
801051ec:	85 c0                	test   %eax,%eax
801051ee:	78 60                	js     80105250 <sys_mknod+0x80>
801051f0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801051f3:	83 ec 08             	sub    $0x8,%esp
801051f6:	50                   	push   %eax
801051f7:	6a 01                	push   $0x1
801051f9:	e8 82 f5 ff ff       	call   80104780 <argint>
801051fe:	83 c4 10             	add    $0x10,%esp
80105201:	85 c0                	test   %eax,%eax
80105203:	78 4b                	js     80105250 <sys_mknod+0x80>
80105205:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105208:	83 ec 08             	sub    $0x8,%esp
8010520b:	50                   	push   %eax
8010520c:	6a 02                	push   $0x2
8010520e:	e8 6d f5 ff ff       	call   80104780 <argint>
80105213:	83 c4 10             	add    $0x10,%esp
80105216:	85 c0                	test   %eax,%eax
80105218:	78 36                	js     80105250 <sys_mknod+0x80>
8010521a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010521e:	83 ec 0c             	sub    $0xc,%esp
80105221:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105225:	ba 03 00 00 00       	mov    $0x3,%edx
8010522a:	50                   	push   %eax
8010522b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010522e:	e8 9d f6 ff ff       	call   801048d0 <create>
80105233:	83 c4 10             	add    $0x10,%esp
80105236:	85 c0                	test   %eax,%eax
80105238:	74 16                	je     80105250 <sys_mknod+0x80>
8010523a:	83 ec 0c             	sub    $0xc,%esp
8010523d:	50                   	push   %eax
8010523e:	e8 ad c6 ff ff       	call   801018f0 <iunlockput>
80105243:	e8 68 d9 ff ff       	call   80102bb0 <end_op>
80105248:	83 c4 10             	add    $0x10,%esp
8010524b:	31 c0                	xor    %eax,%eax
8010524d:	c9                   	leave  
8010524e:	c3                   	ret    
8010524f:	90                   	nop
80105250:	e8 5b d9 ff ff       	call   80102bb0 <end_op>
80105255:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010525a:	c9                   	leave  
8010525b:	c3                   	ret    
8010525c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105260 <sys_chdir>:
80105260:	55                   	push   %ebp
80105261:	89 e5                	mov    %esp,%ebp
80105263:	56                   	push   %esi
80105264:	53                   	push   %ebx
80105265:	83 ec 10             	sub    $0x10,%esp
80105268:	e8 03 e5 ff ff       	call   80103770 <myproc>
8010526d:	89 c6                	mov    %eax,%esi
8010526f:	e8 cc d8 ff ff       	call   80102b40 <begin_op>
80105274:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105277:	83 ec 08             	sub    $0x8,%esp
8010527a:	50                   	push   %eax
8010527b:	6a 00                	push   $0x0
8010527d:	e8 ae f5 ff ff       	call   80104830 <argstr>
80105282:	83 c4 10             	add    $0x10,%esp
80105285:	85 c0                	test   %eax,%eax
80105287:	78 77                	js     80105300 <sys_chdir+0xa0>
80105289:	83 ec 0c             	sub    $0xc,%esp
8010528c:	ff 75 f4             	pushl  -0xc(%ebp)
8010528f:	e8 1c cc ff ff       	call   80101eb0 <namei>
80105294:	83 c4 10             	add    $0x10,%esp
80105297:	85 c0                	test   %eax,%eax
80105299:	89 c3                	mov    %eax,%ebx
8010529b:	74 63                	je     80105300 <sys_chdir+0xa0>
8010529d:	83 ec 0c             	sub    $0xc,%esp
801052a0:	50                   	push   %eax
801052a1:	e8 ba c3 ff ff       	call   80101660 <ilock>
801052a6:	83 c4 10             	add    $0x10,%esp
801052a9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052ae:	75 30                	jne    801052e0 <sys_chdir+0x80>
801052b0:	83 ec 0c             	sub    $0xc,%esp
801052b3:	53                   	push   %ebx
801052b4:	e8 87 c4 ff ff       	call   80101740 <iunlock>
801052b9:	58                   	pop    %eax
801052ba:	ff 76 68             	pushl  0x68(%esi)
801052bd:	e8 ce c4 ff ff       	call   80101790 <iput>
801052c2:	e8 e9 d8 ff ff       	call   80102bb0 <end_op>
801052c7:	89 5e 68             	mov    %ebx,0x68(%esi)
801052ca:	83 c4 10             	add    $0x10,%esp
801052cd:	31 c0                	xor    %eax,%eax
801052cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801052d2:	5b                   	pop    %ebx
801052d3:	5e                   	pop    %esi
801052d4:	5d                   	pop    %ebp
801052d5:	c3                   	ret    
801052d6:	8d 76 00             	lea    0x0(%esi),%esi
801052d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801052e0:	83 ec 0c             	sub    $0xc,%esp
801052e3:	53                   	push   %ebx
801052e4:	e8 07 c6 ff ff       	call   801018f0 <iunlockput>
801052e9:	e8 c2 d8 ff ff       	call   80102bb0 <end_op>
801052ee:	83 c4 10             	add    $0x10,%esp
801052f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052f6:	eb d7                	jmp    801052cf <sys_chdir+0x6f>
801052f8:	90                   	nop
801052f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105300:	e8 ab d8 ff ff       	call   80102bb0 <end_op>
80105305:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010530a:	eb c3                	jmp    801052cf <sys_chdir+0x6f>
8010530c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105310 <sys_exec>:
80105310:	55                   	push   %ebp
80105311:	89 e5                	mov    %esp,%ebp
80105313:	57                   	push   %edi
80105314:	56                   	push   %esi
80105315:	53                   	push   %ebx
80105316:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010531c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105322:	50                   	push   %eax
80105323:	6a 00                	push   $0x0
80105325:	e8 06 f5 ff ff       	call   80104830 <argstr>
8010532a:	83 c4 10             	add    $0x10,%esp
8010532d:	85 c0                	test   %eax,%eax
8010532f:	78 7f                	js     801053b0 <sys_exec+0xa0>
80105331:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105337:	83 ec 08             	sub    $0x8,%esp
8010533a:	50                   	push   %eax
8010533b:	6a 01                	push   $0x1
8010533d:	e8 3e f4 ff ff       	call   80104780 <argint>
80105342:	83 c4 10             	add    $0x10,%esp
80105345:	85 c0                	test   %eax,%eax
80105347:	78 67                	js     801053b0 <sys_exec+0xa0>
80105349:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010534f:	83 ec 04             	sub    $0x4,%esp
80105352:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105358:	68 80 00 00 00       	push   $0x80
8010535d:	6a 00                	push   $0x0
8010535f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105365:	50                   	push   %eax
80105366:	31 db                	xor    %ebx,%ebx
80105368:	e8 03 f1 ff ff       	call   80104470 <memset>
8010536d:	83 c4 10             	add    $0x10,%esp
80105370:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105376:	83 ec 08             	sub    $0x8,%esp
80105379:	57                   	push   %edi
8010537a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
8010537d:	50                   	push   %eax
8010537e:	e8 5d f3 ff ff       	call   801046e0 <fetchint>
80105383:	83 c4 10             	add    $0x10,%esp
80105386:	85 c0                	test   %eax,%eax
80105388:	78 26                	js     801053b0 <sys_exec+0xa0>
8010538a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105390:	85 c0                	test   %eax,%eax
80105392:	74 2c                	je     801053c0 <sys_exec+0xb0>
80105394:	83 ec 08             	sub    $0x8,%esp
80105397:	56                   	push   %esi
80105398:	50                   	push   %eax
80105399:	e8 82 f3 ff ff       	call   80104720 <fetchstr>
8010539e:	83 c4 10             	add    $0x10,%esp
801053a1:	85 c0                	test   %eax,%eax
801053a3:	78 0b                	js     801053b0 <sys_exec+0xa0>
801053a5:	83 c3 01             	add    $0x1,%ebx
801053a8:	83 c6 04             	add    $0x4,%esi
801053ab:	83 fb 20             	cmp    $0x20,%ebx
801053ae:	75 c0                	jne    80105370 <sys_exec+0x60>
801053b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053b8:	5b                   	pop    %ebx
801053b9:	5e                   	pop    %esi
801053ba:	5f                   	pop    %edi
801053bb:	5d                   	pop    %ebp
801053bc:	c3                   	ret    
801053bd:	8d 76 00             	lea    0x0(%esi),%esi
801053c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801053c6:	83 ec 08             	sub    $0x8,%esp
801053c9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801053d0:	00 00 00 00 
801053d4:	50                   	push   %eax
801053d5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801053db:	e8 10 b6 ff ff       	call   801009f0 <exec>
801053e0:	83 c4 10             	add    $0x10,%esp
801053e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053e6:	5b                   	pop    %ebx
801053e7:	5e                   	pop    %esi
801053e8:	5f                   	pop    %edi
801053e9:	5d                   	pop    %ebp
801053ea:	c3                   	ret    
801053eb:	90                   	nop
801053ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801053f0 <sys_pipe>:
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	57                   	push   %edi
801053f4:	56                   	push   %esi
801053f5:	53                   	push   %ebx
801053f6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801053f9:	83 ec 20             	sub    $0x20,%esp
801053fc:	6a 08                	push   $0x8
801053fe:	50                   	push   %eax
801053ff:	6a 00                	push   $0x0
80105401:	e8 ca f3 ff ff       	call   801047d0 <argptr>
80105406:	83 c4 10             	add    $0x10,%esp
80105409:	85 c0                	test   %eax,%eax
8010540b:	78 4a                	js     80105457 <sys_pipe+0x67>
8010540d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105410:	83 ec 08             	sub    $0x8,%esp
80105413:	50                   	push   %eax
80105414:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105417:	50                   	push   %eax
80105418:	e8 c3 dd ff ff       	call   801031e0 <pipealloc>
8010541d:	83 c4 10             	add    $0x10,%esp
80105420:	85 c0                	test   %eax,%eax
80105422:	78 33                	js     80105457 <sys_pipe+0x67>
80105424:	31 db                	xor    %ebx,%ebx
80105426:	8b 7d e0             	mov    -0x20(%ebp),%edi
80105429:	e8 42 e3 ff ff       	call   80103770 <myproc>
8010542e:	66 90                	xchg   %ax,%ax
80105430:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105434:	85 f6                	test   %esi,%esi
80105436:	74 30                	je     80105468 <sys_pipe+0x78>
80105438:	83 c3 01             	add    $0x1,%ebx
8010543b:	83 fb 10             	cmp    $0x10,%ebx
8010543e:	75 f0                	jne    80105430 <sys_pipe+0x40>
80105440:	83 ec 0c             	sub    $0xc,%esp
80105443:	ff 75 e0             	pushl  -0x20(%ebp)
80105446:	e8 e5 b9 ff ff       	call   80100e30 <fileclose>
8010544b:	58                   	pop    %eax
8010544c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010544f:	e8 dc b9 ff ff       	call   80100e30 <fileclose>
80105454:	83 c4 10             	add    $0x10,%esp
80105457:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010545a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010545f:	5b                   	pop    %ebx
80105460:	5e                   	pop    %esi
80105461:	5f                   	pop    %edi
80105462:	5d                   	pop    %ebp
80105463:	c3                   	ret    
80105464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105468:	8d 73 08             	lea    0x8(%ebx),%esi
8010546b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
8010546f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105472:	e8 f9 e2 ff ff       	call   80103770 <myproc>
80105477:	31 d2                	xor    %edx,%edx
80105479:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105480:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105484:	85 c9                	test   %ecx,%ecx
80105486:	74 18                	je     801054a0 <sys_pipe+0xb0>
80105488:	83 c2 01             	add    $0x1,%edx
8010548b:	83 fa 10             	cmp    $0x10,%edx
8010548e:	75 f0                	jne    80105480 <sys_pipe+0x90>
80105490:	e8 db e2 ff ff       	call   80103770 <myproc>
80105495:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
8010549c:	00 
8010549d:	eb a1                	jmp    80105440 <sys_pipe+0x50>
8010549f:	90                   	nop
801054a0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
801054a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054a7:	89 18                	mov    %ebx,(%eax)
801054a9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054ac:	89 50 04             	mov    %edx,0x4(%eax)
801054af:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054b2:	31 c0                	xor    %eax,%eax
801054b4:	5b                   	pop    %ebx
801054b5:	5e                   	pop    %esi
801054b6:	5f                   	pop    %edi
801054b7:	5d                   	pop    %ebp
801054b8:	c3                   	ret    
801054b9:	66 90                	xchg   %ax,%ax
801054bb:	66 90                	xchg   %ax,%ax
801054bd:	66 90                	xchg   %ax,%ax
801054bf:	90                   	nop

801054c0 <sys_fork>:
801054c0:	55                   	push   %ebp
801054c1:	89 e5                	mov    %esp,%ebp
801054c3:	5d                   	pop    %ebp
801054c4:	e9 47 e4 ff ff       	jmp    80103910 <fork>
801054c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054d0 <sys_exit>:
801054d0:	55                   	push   %ebp
801054d1:	89 e5                	mov    %esp,%ebp
801054d3:	83 ec 08             	sub    $0x8,%esp
801054d6:	e8 d5 e6 ff ff       	call   80103bb0 <exit>
801054db:	31 c0                	xor    %eax,%eax
801054dd:	c9                   	leave  
801054de:	c3                   	ret    
801054df:	90                   	nop

801054e0 <sys_wait>:
801054e0:	55                   	push   %ebp
801054e1:	89 e5                	mov    %esp,%ebp
801054e3:	5d                   	pop    %ebp
801054e4:	e9 07 e9 ff ff       	jmp    80103df0 <wait>
801054e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_kill>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	83 ec 20             	sub    $0x20,%esp
801054f6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054f9:	50                   	push   %eax
801054fa:	6a 00                	push   $0x0
801054fc:	e8 7f f2 ff ff       	call   80104780 <argint>
80105501:	83 c4 10             	add    $0x10,%esp
80105504:	85 c0                	test   %eax,%eax
80105506:	78 18                	js     80105520 <sys_kill+0x30>
80105508:	83 ec 0c             	sub    $0xc,%esp
8010550b:	ff 75 f4             	pushl  -0xc(%ebp)
8010550e:	e8 2d ea ff ff       	call   80103f40 <kill>
80105513:	83 c4 10             	add    $0x10,%esp
80105516:	c9                   	leave  
80105517:	c3                   	ret    
80105518:	90                   	nop
80105519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105520:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105525:	c9                   	leave  
80105526:	c3                   	ret    
80105527:	89 f6                	mov    %esi,%esi
80105529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105530 <sys_getpid>:
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	83 ec 08             	sub    $0x8,%esp
80105536:	e8 35 e2 ff ff       	call   80103770 <myproc>
8010553b:	8b 40 10             	mov    0x10(%eax),%eax
8010553e:	c9                   	leave  
8010553f:	c3                   	ret    

80105540 <sys_sbrk>:
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	53                   	push   %ebx
80105544:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105547:	83 ec 1c             	sub    $0x1c,%esp
8010554a:	50                   	push   %eax
8010554b:	6a 00                	push   $0x0
8010554d:	e8 2e f2 ff ff       	call   80104780 <argint>
80105552:	83 c4 10             	add    $0x10,%esp
80105555:	85 c0                	test   %eax,%eax
80105557:	78 27                	js     80105580 <sys_sbrk+0x40>
80105559:	e8 12 e2 ff ff       	call   80103770 <myproc>
8010555e:	83 ec 0c             	sub    $0xc,%esp
80105561:	8b 18                	mov    (%eax),%ebx
80105563:	ff 75 f4             	pushl  -0xc(%ebp)
80105566:	e8 25 e3 ff ff       	call   80103890 <growproc>
8010556b:	83 c4 10             	add    $0x10,%esp
8010556e:	85 c0                	test   %eax,%eax
80105570:	78 0e                	js     80105580 <sys_sbrk+0x40>
80105572:	89 d8                	mov    %ebx,%eax
80105574:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105577:	c9                   	leave  
80105578:	c3                   	ret    
80105579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105580:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105585:	eb ed                	jmp    80105574 <sys_sbrk+0x34>
80105587:	89 f6                	mov    %esi,%esi
80105589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105590 <sys_sleep>:
80105590:	55                   	push   %ebp
80105591:	89 e5                	mov    %esp,%ebp
80105593:	53                   	push   %ebx
80105594:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105597:	83 ec 1c             	sub    $0x1c,%esp
8010559a:	50                   	push   %eax
8010559b:	6a 00                	push   $0x0
8010559d:	e8 de f1 ff ff       	call   80104780 <argint>
801055a2:	83 c4 10             	add    $0x10,%esp
801055a5:	85 c0                	test   %eax,%eax
801055a7:	0f 88 8a 00 00 00    	js     80105637 <sys_sleep+0xa7>
801055ad:	83 ec 0c             	sub    $0xc,%esp
801055b0:	68 60 4d 11 80       	push   $0x80114d60
801055b5:	e8 b6 ed ff ff       	call   80104370 <acquire>
801055ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055bd:	83 c4 10             	add    $0x10,%esp
801055c0:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
801055c6:	85 d2                	test   %edx,%edx
801055c8:	75 27                	jne    801055f1 <sys_sleep+0x61>
801055ca:	eb 54                	jmp    80105620 <sys_sleep+0x90>
801055cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801055d0:	83 ec 08             	sub    $0x8,%esp
801055d3:	68 60 4d 11 80       	push   $0x80114d60
801055d8:	68 a0 55 11 80       	push   $0x801155a0
801055dd:	e8 4e e7 ff ff       	call   80103d30 <sleep>
801055e2:	a1 a0 55 11 80       	mov    0x801155a0,%eax
801055e7:	83 c4 10             	add    $0x10,%esp
801055ea:	29 d8                	sub    %ebx,%eax
801055ec:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801055ef:	73 2f                	jae    80105620 <sys_sleep+0x90>
801055f1:	e8 7a e1 ff ff       	call   80103770 <myproc>
801055f6:	8b 40 24             	mov    0x24(%eax),%eax
801055f9:	85 c0                	test   %eax,%eax
801055fb:	74 d3                	je     801055d0 <sys_sleep+0x40>
801055fd:	83 ec 0c             	sub    $0xc,%esp
80105600:	68 60 4d 11 80       	push   $0x80114d60
80105605:	e8 16 ee ff ff       	call   80104420 <release>
8010560a:	83 c4 10             	add    $0x10,%esp
8010560d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105612:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105615:	c9                   	leave  
80105616:	c3                   	ret    
80105617:	89 f6                	mov    %esi,%esi
80105619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105620:	83 ec 0c             	sub    $0xc,%esp
80105623:	68 60 4d 11 80       	push   $0x80114d60
80105628:	e8 f3 ed ff ff       	call   80104420 <release>
8010562d:	83 c4 10             	add    $0x10,%esp
80105630:	31 c0                	xor    %eax,%eax
80105632:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105635:	c9                   	leave  
80105636:	c3                   	ret    
80105637:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010563c:	eb d4                	jmp    80105612 <sys_sleep+0x82>
8010563e:	66 90                	xchg   %ax,%ax

80105640 <sys_uptime>:
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	53                   	push   %ebx
80105644:	83 ec 10             	sub    $0x10,%esp
80105647:	68 60 4d 11 80       	push   $0x80114d60
8010564c:	e8 1f ed ff ff       	call   80104370 <acquire>
80105651:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
80105657:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
8010565e:	e8 bd ed ff ff       	call   80104420 <release>
80105663:	89 d8                	mov    %ebx,%eax
80105665:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105668:	c9                   	leave  
80105669:	c3                   	ret    
8010566a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105670 <sys_cps>:
80105670:	55                   	push   %ebp
80105671:	89 e5                	mov    %esp,%ebp
80105673:	5d                   	pop    %ebp
80105674:	e9 17 ea ff ff       	jmp    80104090 <cps>

80105679 <alltraps>:
80105679:	1e                   	push   %ds
8010567a:	06                   	push   %es
8010567b:	0f a0                	push   %fs
8010567d:	0f a8                	push   %gs
8010567f:	60                   	pusha  
80105680:	66 b8 10 00          	mov    $0x10,%ax
80105684:	8e d8                	mov    %eax,%ds
80105686:	8e c0                	mov    %eax,%es
80105688:	54                   	push   %esp
80105689:	e8 e2 00 00 00       	call   80105770 <trap>
8010568e:	83 c4 04             	add    $0x4,%esp

80105691 <trapret>:
80105691:	61                   	popa   
80105692:	0f a9                	pop    %gs
80105694:	0f a1                	pop    %fs
80105696:	07                   	pop    %es
80105697:	1f                   	pop    %ds
80105698:	83 c4 08             	add    $0x8,%esp
8010569b:	cf                   	iret   
8010569c:	66 90                	xchg   %ax,%ax
8010569e:	66 90                	xchg   %ax,%ax

801056a0 <tvinit>:
801056a0:	31 c0                	xor    %eax,%eax
801056a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801056a8:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
801056af:	b9 08 00 00 00       	mov    $0x8,%ecx
801056b4:	c6 04 c5 a4 4d 11 80 	movb   $0x0,-0x7feeb25c(,%eax,8)
801056bb:	00 
801056bc:	66 89 0c c5 a2 4d 11 	mov    %cx,-0x7feeb25e(,%eax,8)
801056c3:	80 
801056c4:	c6 04 c5 a5 4d 11 80 	movb   $0x8e,-0x7feeb25b(,%eax,8)
801056cb:	8e 
801056cc:	66 89 14 c5 a0 4d 11 	mov    %dx,-0x7feeb260(,%eax,8)
801056d3:	80 
801056d4:	c1 ea 10             	shr    $0x10,%edx
801056d7:	66 89 14 c5 a6 4d 11 	mov    %dx,-0x7feeb25a(,%eax,8)
801056de:	80 
801056df:	83 c0 01             	add    $0x1,%eax
801056e2:	3d 00 01 00 00       	cmp    $0x100,%eax
801056e7:	75 bf                	jne    801056a8 <tvinit+0x8>
801056e9:	55                   	push   %ebp
801056ea:	ba 08 00 00 00       	mov    $0x8,%edx
801056ef:	89 e5                	mov    %esp,%ebp
801056f1:	83 ec 10             	sub    $0x10,%esp
801056f4:	a1 08 a1 10 80       	mov    0x8010a108,%eax
801056f9:	68 fd 76 10 80       	push   $0x801076fd
801056fe:	68 60 4d 11 80       	push   $0x80114d60
80105703:	66 89 15 a2 4f 11 80 	mov    %dx,0x80114fa2
8010570a:	c6 05 a4 4f 11 80 00 	movb   $0x0,0x80114fa4
80105711:	66 a3 a0 4f 11 80    	mov    %ax,0x80114fa0
80105717:	c1 e8 10             	shr    $0x10,%eax
8010571a:	c6 05 a5 4f 11 80 ef 	movb   $0xef,0x80114fa5
80105721:	66 a3 a6 4f 11 80    	mov    %ax,0x80114fa6
80105727:	e8 e4 ea ff ff       	call   80104210 <initlock>
8010572c:	83 c4 10             	add    $0x10,%esp
8010572f:	c9                   	leave  
80105730:	c3                   	ret    
80105731:	eb 0d                	jmp    80105740 <idtinit>
80105733:	90                   	nop
80105734:	90                   	nop
80105735:	90                   	nop
80105736:	90                   	nop
80105737:	90                   	nop
80105738:	90                   	nop
80105739:	90                   	nop
8010573a:	90                   	nop
8010573b:	90                   	nop
8010573c:	90                   	nop
8010573d:	90                   	nop
8010573e:	90                   	nop
8010573f:	90                   	nop

80105740 <idtinit>:
80105740:	55                   	push   %ebp
80105741:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105746:	89 e5                	mov    %esp,%ebp
80105748:	83 ec 10             	sub    $0x10,%esp
8010574b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010574f:	b8 a0 4d 11 80       	mov    $0x80114da0,%eax
80105754:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105758:	c1 e8 10             	shr    $0x10,%eax
8010575b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010575f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105762:	0f 01 18             	lidtl  (%eax)
80105765:	c9                   	leave  
80105766:	c3                   	ret    
80105767:	89 f6                	mov    %esi,%esi
80105769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105770 <trap>:
80105770:	55                   	push   %ebp
80105771:	89 e5                	mov    %esp,%ebp
80105773:	57                   	push   %edi
80105774:	56                   	push   %esi
80105775:	53                   	push   %ebx
80105776:	83 ec 1c             	sub    $0x1c,%esp
80105779:	8b 7d 08             	mov    0x8(%ebp),%edi
8010577c:	8b 47 30             	mov    0x30(%edi),%eax
8010577f:	83 f8 40             	cmp    $0x40,%eax
80105782:	0f 84 88 01 00 00    	je     80105910 <trap+0x1a0>
80105788:	83 e8 20             	sub    $0x20,%eax
8010578b:	83 f8 1f             	cmp    $0x1f,%eax
8010578e:	77 10                	ja     801057a0 <trap+0x30>
80105790:	ff 24 85 a4 77 10 80 	jmp    *-0x7fef885c(,%eax,4)
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801057a0:	e8 cb df ff ff       	call   80103770 <myproc>
801057a5:	85 c0                	test   %eax,%eax
801057a7:	0f 84 d7 01 00 00    	je     80105984 <trap+0x214>
801057ad:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801057b1:	0f 84 cd 01 00 00    	je     80105984 <trap+0x214>
801057b7:	0f 20 d1             	mov    %cr2,%ecx
801057ba:	8b 57 38             	mov    0x38(%edi),%edx
801057bd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801057c0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801057c3:	e8 88 df ff ff       	call   80103750 <cpuid>
801057c8:	8b 77 34             	mov    0x34(%edi),%esi
801057cb:	8b 5f 30             	mov    0x30(%edi),%ebx
801057ce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801057d1:	e8 9a df ff ff       	call   80103770 <myproc>
801057d6:	89 45 e0             	mov    %eax,-0x20(%ebp)
801057d9:	e8 92 df ff ff       	call   80103770 <myproc>
801057de:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801057e1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801057e4:	51                   	push   %ecx
801057e5:	52                   	push   %edx
801057e6:	8b 55 e0             	mov    -0x20(%ebp),%edx
801057e9:	ff 75 e4             	pushl  -0x1c(%ebp)
801057ec:	56                   	push   %esi
801057ed:	53                   	push   %ebx
801057ee:	83 c2 6c             	add    $0x6c,%edx
801057f1:	52                   	push   %edx
801057f2:	ff 70 10             	pushl  0x10(%eax)
801057f5:	68 60 77 10 80       	push   $0x80107760
801057fa:	e8 61 ae ff ff       	call   80100660 <cprintf>
801057ff:	83 c4 20             	add    $0x20,%esp
80105802:	e8 69 df ff ff       	call   80103770 <myproc>
80105807:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010580e:	66 90                	xchg   %ax,%ax
80105810:	e8 5b df ff ff       	call   80103770 <myproc>
80105815:	85 c0                	test   %eax,%eax
80105817:	74 0c                	je     80105825 <trap+0xb5>
80105819:	e8 52 df ff ff       	call   80103770 <myproc>
8010581e:	8b 50 24             	mov    0x24(%eax),%edx
80105821:	85 d2                	test   %edx,%edx
80105823:	75 4b                	jne    80105870 <trap+0x100>
80105825:	e8 46 df ff ff       	call   80103770 <myproc>
8010582a:	85 c0                	test   %eax,%eax
8010582c:	74 0b                	je     80105839 <trap+0xc9>
8010582e:	e8 3d df ff ff       	call   80103770 <myproc>
80105833:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105837:	74 4f                	je     80105888 <trap+0x118>
80105839:	e8 32 df ff ff       	call   80103770 <myproc>
8010583e:	85 c0                	test   %eax,%eax
80105840:	74 1d                	je     8010585f <trap+0xef>
80105842:	e8 29 df ff ff       	call   80103770 <myproc>
80105847:	8b 40 24             	mov    0x24(%eax),%eax
8010584a:	85 c0                	test   %eax,%eax
8010584c:	74 11                	je     8010585f <trap+0xef>
8010584e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105852:	83 e0 03             	and    $0x3,%eax
80105855:	66 83 f8 03          	cmp    $0x3,%ax
80105859:	0f 84 da 00 00 00    	je     80105939 <trap+0x1c9>
8010585f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105862:	5b                   	pop    %ebx
80105863:	5e                   	pop    %esi
80105864:	5f                   	pop    %edi
80105865:	5d                   	pop    %ebp
80105866:	c3                   	ret    
80105867:	89 f6                	mov    %esi,%esi
80105869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105870:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105874:	83 e0 03             	and    $0x3,%eax
80105877:	66 83 f8 03          	cmp    $0x3,%ax
8010587b:	75 a8                	jne    80105825 <trap+0xb5>
8010587d:	e8 2e e3 ff ff       	call   80103bb0 <exit>
80105882:	eb a1                	jmp    80105825 <trap+0xb5>
80105884:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105888:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010588c:	75 ab                	jne    80105839 <trap+0xc9>
8010588e:	e8 4d e4 ff ff       	call   80103ce0 <yield>
80105893:	eb a4                	jmp    80105839 <trap+0xc9>
80105895:	8d 76 00             	lea    0x0(%esi),%esi
80105898:	e8 b3 de ff ff       	call   80103750 <cpuid>
8010589d:	85 c0                	test   %eax,%eax
8010589f:	0f 84 ab 00 00 00    	je     80105950 <trap+0x1e0>
801058a5:	e8 56 ce ff ff       	call   80102700 <lapiceoi>
801058aa:	e9 61 ff ff ff       	jmp    80105810 <trap+0xa0>
801058af:	90                   	nop
801058b0:	e8 0b cd ff ff       	call   801025c0 <kbdintr>
801058b5:	e8 46 ce ff ff       	call   80102700 <lapiceoi>
801058ba:	e9 51 ff ff ff       	jmp    80105810 <trap+0xa0>
801058bf:	90                   	nop
801058c0:	e8 5b 02 00 00       	call   80105b20 <uartintr>
801058c5:	e8 36 ce ff ff       	call   80102700 <lapiceoi>
801058ca:	e9 41 ff ff ff       	jmp    80105810 <trap+0xa0>
801058cf:	90                   	nop
801058d0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
801058d4:	8b 77 38             	mov    0x38(%edi),%esi
801058d7:	e8 74 de ff ff       	call   80103750 <cpuid>
801058dc:	56                   	push   %esi
801058dd:	53                   	push   %ebx
801058de:	50                   	push   %eax
801058df:	68 08 77 10 80       	push   $0x80107708
801058e4:	e8 77 ad ff ff       	call   80100660 <cprintf>
801058e9:	e8 12 ce ff ff       	call   80102700 <lapiceoi>
801058ee:	83 c4 10             	add    $0x10,%esp
801058f1:	e9 1a ff ff ff       	jmp    80105810 <trap+0xa0>
801058f6:	8d 76 00             	lea    0x0(%esi),%esi
801058f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105900:	e8 3b c7 ff ff       	call   80102040 <ideintr>
80105905:	eb 9e                	jmp    801058a5 <trap+0x135>
80105907:	89 f6                	mov    %esi,%esi
80105909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105910:	e8 5b de ff ff       	call   80103770 <myproc>
80105915:	8b 58 24             	mov    0x24(%eax),%ebx
80105918:	85 db                	test   %ebx,%ebx
8010591a:	75 2c                	jne    80105948 <trap+0x1d8>
8010591c:	e8 4f de ff ff       	call   80103770 <myproc>
80105921:	89 78 18             	mov    %edi,0x18(%eax)
80105924:	e8 47 ef ff ff       	call   80104870 <syscall>
80105929:	e8 42 de ff ff       	call   80103770 <myproc>
8010592e:	8b 48 24             	mov    0x24(%eax),%ecx
80105931:	85 c9                	test   %ecx,%ecx
80105933:	0f 84 26 ff ff ff    	je     8010585f <trap+0xef>
80105939:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010593c:	5b                   	pop    %ebx
8010593d:	5e                   	pop    %esi
8010593e:	5f                   	pop    %edi
8010593f:	5d                   	pop    %ebp
80105940:	e9 6b e2 ff ff       	jmp    80103bb0 <exit>
80105945:	8d 76 00             	lea    0x0(%esi),%esi
80105948:	e8 63 e2 ff ff       	call   80103bb0 <exit>
8010594d:	eb cd                	jmp    8010591c <trap+0x1ac>
8010594f:	90                   	nop
80105950:	83 ec 0c             	sub    $0xc,%esp
80105953:	68 60 4d 11 80       	push   $0x80114d60
80105958:	e8 13 ea ff ff       	call   80104370 <acquire>
8010595d:	c7 04 24 a0 55 11 80 	movl   $0x801155a0,(%esp)
80105964:	83 05 a0 55 11 80 01 	addl   $0x1,0x801155a0
8010596b:	e8 70 e5 ff ff       	call   80103ee0 <wakeup>
80105970:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
80105977:	e8 a4 ea ff ff       	call   80104420 <release>
8010597c:	83 c4 10             	add    $0x10,%esp
8010597f:	e9 21 ff ff ff       	jmp    801058a5 <trap+0x135>
80105984:	0f 20 d6             	mov    %cr2,%esi
80105987:	8b 5f 38             	mov    0x38(%edi),%ebx
8010598a:	e8 c1 dd ff ff       	call   80103750 <cpuid>
8010598f:	83 ec 0c             	sub    $0xc,%esp
80105992:	56                   	push   %esi
80105993:	53                   	push   %ebx
80105994:	50                   	push   %eax
80105995:	ff 77 30             	pushl  0x30(%edi)
80105998:	68 2c 77 10 80       	push   $0x8010772c
8010599d:	e8 be ac ff ff       	call   80100660 <cprintf>
801059a2:	83 c4 14             	add    $0x14,%esp
801059a5:	68 02 77 10 80       	push   $0x80107702
801059aa:	e8 c1 a9 ff ff       	call   80100370 <panic>
801059af:	90                   	nop

801059b0 <uartgetc>:
801059b0:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
801059b5:	55                   	push   %ebp
801059b6:	89 e5                	mov    %esp,%ebp
801059b8:	85 c0                	test   %eax,%eax
801059ba:	74 1c                	je     801059d8 <uartgetc+0x28>
801059bc:	ba fd 03 00 00       	mov    $0x3fd,%edx
801059c1:	ec                   	in     (%dx),%al
801059c2:	a8 01                	test   $0x1,%al
801059c4:	74 12                	je     801059d8 <uartgetc+0x28>
801059c6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801059cb:	ec                   	in     (%dx),%al
801059cc:	0f b6 c0             	movzbl %al,%eax
801059cf:	5d                   	pop    %ebp
801059d0:	c3                   	ret    
801059d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801059d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059dd:	5d                   	pop    %ebp
801059de:	c3                   	ret    
801059df:	90                   	nop

801059e0 <uartputc.part.0>:
801059e0:	55                   	push   %ebp
801059e1:	89 e5                	mov    %esp,%ebp
801059e3:	57                   	push   %edi
801059e4:	56                   	push   %esi
801059e5:	53                   	push   %ebx
801059e6:	89 c7                	mov    %eax,%edi
801059e8:	bb 80 00 00 00       	mov    $0x80,%ebx
801059ed:	be fd 03 00 00       	mov    $0x3fd,%esi
801059f2:	83 ec 0c             	sub    $0xc,%esp
801059f5:	eb 1b                	jmp    80105a12 <uartputc.part.0+0x32>
801059f7:	89 f6                	mov    %esi,%esi
801059f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105a00:	83 ec 0c             	sub    $0xc,%esp
80105a03:	6a 0a                	push   $0xa
80105a05:	e8 16 cd ff ff       	call   80102720 <microdelay>
80105a0a:	83 c4 10             	add    $0x10,%esp
80105a0d:	83 eb 01             	sub    $0x1,%ebx
80105a10:	74 07                	je     80105a19 <uartputc.part.0+0x39>
80105a12:	89 f2                	mov    %esi,%edx
80105a14:	ec                   	in     (%dx),%al
80105a15:	a8 20                	test   $0x20,%al
80105a17:	74 e7                	je     80105a00 <uartputc.part.0+0x20>
80105a19:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a1e:	89 f8                	mov    %edi,%eax
80105a20:	ee                   	out    %al,(%dx)
80105a21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a24:	5b                   	pop    %ebx
80105a25:	5e                   	pop    %esi
80105a26:	5f                   	pop    %edi
80105a27:	5d                   	pop    %ebp
80105a28:	c3                   	ret    
80105a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a30 <uartinit>:
80105a30:	55                   	push   %ebp
80105a31:	31 c9                	xor    %ecx,%ecx
80105a33:	89 c8                	mov    %ecx,%eax
80105a35:	89 e5                	mov    %esp,%ebp
80105a37:	57                   	push   %edi
80105a38:	56                   	push   %esi
80105a39:	53                   	push   %ebx
80105a3a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105a3f:	89 da                	mov    %ebx,%edx
80105a41:	83 ec 0c             	sub    $0xc,%esp
80105a44:	ee                   	out    %al,(%dx)
80105a45:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105a4a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105a4f:	89 fa                	mov    %edi,%edx
80105a51:	ee                   	out    %al,(%dx)
80105a52:	b8 0c 00 00 00       	mov    $0xc,%eax
80105a57:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a5c:	ee                   	out    %al,(%dx)
80105a5d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105a62:	89 c8                	mov    %ecx,%eax
80105a64:	89 f2                	mov    %esi,%edx
80105a66:	ee                   	out    %al,(%dx)
80105a67:	b8 03 00 00 00       	mov    $0x3,%eax
80105a6c:	89 fa                	mov    %edi,%edx
80105a6e:	ee                   	out    %al,(%dx)
80105a6f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105a74:	89 c8                	mov    %ecx,%eax
80105a76:	ee                   	out    %al,(%dx)
80105a77:	b8 01 00 00 00       	mov    $0x1,%eax
80105a7c:	89 f2                	mov    %esi,%edx
80105a7e:	ee                   	out    %al,(%dx)
80105a7f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105a84:	ec                   	in     (%dx),%al
80105a85:	3c ff                	cmp    $0xff,%al
80105a87:	74 5a                	je     80105ae3 <uartinit+0xb3>
80105a89:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105a90:	00 00 00 
80105a93:	89 da                	mov    %ebx,%edx
80105a95:	ec                   	in     (%dx),%al
80105a96:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a9b:	ec                   	in     (%dx),%al
80105a9c:	83 ec 08             	sub    $0x8,%esp
80105a9f:	bb 24 78 10 80       	mov    $0x80107824,%ebx
80105aa4:	6a 00                	push   $0x0
80105aa6:	6a 04                	push   $0x4
80105aa8:	e8 e3 c7 ff ff       	call   80102290 <ioapicenable>
80105aad:	83 c4 10             	add    $0x10,%esp
80105ab0:	b8 78 00 00 00       	mov    $0x78,%eax
80105ab5:	eb 13                	jmp    80105aca <uartinit+0x9a>
80105ab7:	89 f6                	mov    %esi,%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ac0:	83 c3 01             	add    $0x1,%ebx
80105ac3:	0f be 03             	movsbl (%ebx),%eax
80105ac6:	84 c0                	test   %al,%al
80105ac8:	74 19                	je     80105ae3 <uartinit+0xb3>
80105aca:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105ad0:	85 d2                	test   %edx,%edx
80105ad2:	74 ec                	je     80105ac0 <uartinit+0x90>
80105ad4:	83 c3 01             	add    $0x1,%ebx
80105ad7:	e8 04 ff ff ff       	call   801059e0 <uartputc.part.0>
80105adc:	0f be 03             	movsbl (%ebx),%eax
80105adf:	84 c0                	test   %al,%al
80105ae1:	75 e7                	jne    80105aca <uartinit+0x9a>
80105ae3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ae6:	5b                   	pop    %ebx
80105ae7:	5e                   	pop    %esi
80105ae8:	5f                   	pop    %edi
80105ae9:	5d                   	pop    %ebp
80105aea:	c3                   	ret    
80105aeb:	90                   	nop
80105aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105af0 <uartputc>:
80105af0:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105af6:	55                   	push   %ebp
80105af7:	89 e5                	mov    %esp,%ebp
80105af9:	85 d2                	test   %edx,%edx
80105afb:	8b 45 08             	mov    0x8(%ebp),%eax
80105afe:	74 10                	je     80105b10 <uartputc+0x20>
80105b00:	5d                   	pop    %ebp
80105b01:	e9 da fe ff ff       	jmp    801059e0 <uartputc.part.0>
80105b06:	8d 76 00             	lea    0x0(%esi),%esi
80105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b10:	5d                   	pop    %ebp
80105b11:	c3                   	ret    
80105b12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b20 <uartintr>:
80105b20:	55                   	push   %ebp
80105b21:	89 e5                	mov    %esp,%ebp
80105b23:	83 ec 14             	sub    $0x14,%esp
80105b26:	68 b0 59 10 80       	push   $0x801059b0
80105b2b:	e8 c0 ac ff ff       	call   801007f0 <consoleintr>
80105b30:	83 c4 10             	add    $0x10,%esp
80105b33:	c9                   	leave  
80105b34:	c3                   	ret    

80105b35 <vector0>:
80105b35:	6a 00                	push   $0x0
80105b37:	6a 00                	push   $0x0
80105b39:	e9 3b fb ff ff       	jmp    80105679 <alltraps>

80105b3e <vector1>:
80105b3e:	6a 00                	push   $0x0
80105b40:	6a 01                	push   $0x1
80105b42:	e9 32 fb ff ff       	jmp    80105679 <alltraps>

80105b47 <vector2>:
80105b47:	6a 00                	push   $0x0
80105b49:	6a 02                	push   $0x2
80105b4b:	e9 29 fb ff ff       	jmp    80105679 <alltraps>

80105b50 <vector3>:
80105b50:	6a 00                	push   $0x0
80105b52:	6a 03                	push   $0x3
80105b54:	e9 20 fb ff ff       	jmp    80105679 <alltraps>

80105b59 <vector4>:
80105b59:	6a 00                	push   $0x0
80105b5b:	6a 04                	push   $0x4
80105b5d:	e9 17 fb ff ff       	jmp    80105679 <alltraps>

80105b62 <vector5>:
80105b62:	6a 00                	push   $0x0
80105b64:	6a 05                	push   $0x5
80105b66:	e9 0e fb ff ff       	jmp    80105679 <alltraps>

80105b6b <vector6>:
80105b6b:	6a 00                	push   $0x0
80105b6d:	6a 06                	push   $0x6
80105b6f:	e9 05 fb ff ff       	jmp    80105679 <alltraps>

80105b74 <vector7>:
80105b74:	6a 00                	push   $0x0
80105b76:	6a 07                	push   $0x7
80105b78:	e9 fc fa ff ff       	jmp    80105679 <alltraps>

80105b7d <vector8>:
80105b7d:	6a 08                	push   $0x8
80105b7f:	e9 f5 fa ff ff       	jmp    80105679 <alltraps>

80105b84 <vector9>:
80105b84:	6a 00                	push   $0x0
80105b86:	6a 09                	push   $0x9
80105b88:	e9 ec fa ff ff       	jmp    80105679 <alltraps>

80105b8d <vector10>:
80105b8d:	6a 0a                	push   $0xa
80105b8f:	e9 e5 fa ff ff       	jmp    80105679 <alltraps>

80105b94 <vector11>:
80105b94:	6a 0b                	push   $0xb
80105b96:	e9 de fa ff ff       	jmp    80105679 <alltraps>

80105b9b <vector12>:
80105b9b:	6a 0c                	push   $0xc
80105b9d:	e9 d7 fa ff ff       	jmp    80105679 <alltraps>

80105ba2 <vector13>:
80105ba2:	6a 0d                	push   $0xd
80105ba4:	e9 d0 fa ff ff       	jmp    80105679 <alltraps>

80105ba9 <vector14>:
80105ba9:	6a 0e                	push   $0xe
80105bab:	e9 c9 fa ff ff       	jmp    80105679 <alltraps>

80105bb0 <vector15>:
80105bb0:	6a 00                	push   $0x0
80105bb2:	6a 0f                	push   $0xf
80105bb4:	e9 c0 fa ff ff       	jmp    80105679 <alltraps>

80105bb9 <vector16>:
80105bb9:	6a 00                	push   $0x0
80105bbb:	6a 10                	push   $0x10
80105bbd:	e9 b7 fa ff ff       	jmp    80105679 <alltraps>

80105bc2 <vector17>:
80105bc2:	6a 11                	push   $0x11
80105bc4:	e9 b0 fa ff ff       	jmp    80105679 <alltraps>

80105bc9 <vector18>:
80105bc9:	6a 00                	push   $0x0
80105bcb:	6a 12                	push   $0x12
80105bcd:	e9 a7 fa ff ff       	jmp    80105679 <alltraps>

80105bd2 <vector19>:
80105bd2:	6a 00                	push   $0x0
80105bd4:	6a 13                	push   $0x13
80105bd6:	e9 9e fa ff ff       	jmp    80105679 <alltraps>

80105bdb <vector20>:
80105bdb:	6a 00                	push   $0x0
80105bdd:	6a 14                	push   $0x14
80105bdf:	e9 95 fa ff ff       	jmp    80105679 <alltraps>

80105be4 <vector21>:
80105be4:	6a 00                	push   $0x0
80105be6:	6a 15                	push   $0x15
80105be8:	e9 8c fa ff ff       	jmp    80105679 <alltraps>

80105bed <vector22>:
80105bed:	6a 00                	push   $0x0
80105bef:	6a 16                	push   $0x16
80105bf1:	e9 83 fa ff ff       	jmp    80105679 <alltraps>

80105bf6 <vector23>:
80105bf6:	6a 00                	push   $0x0
80105bf8:	6a 17                	push   $0x17
80105bfa:	e9 7a fa ff ff       	jmp    80105679 <alltraps>

80105bff <vector24>:
80105bff:	6a 00                	push   $0x0
80105c01:	6a 18                	push   $0x18
80105c03:	e9 71 fa ff ff       	jmp    80105679 <alltraps>

80105c08 <vector25>:
80105c08:	6a 00                	push   $0x0
80105c0a:	6a 19                	push   $0x19
80105c0c:	e9 68 fa ff ff       	jmp    80105679 <alltraps>

80105c11 <vector26>:
80105c11:	6a 00                	push   $0x0
80105c13:	6a 1a                	push   $0x1a
80105c15:	e9 5f fa ff ff       	jmp    80105679 <alltraps>

80105c1a <vector27>:
80105c1a:	6a 00                	push   $0x0
80105c1c:	6a 1b                	push   $0x1b
80105c1e:	e9 56 fa ff ff       	jmp    80105679 <alltraps>

80105c23 <vector28>:
80105c23:	6a 00                	push   $0x0
80105c25:	6a 1c                	push   $0x1c
80105c27:	e9 4d fa ff ff       	jmp    80105679 <alltraps>

80105c2c <vector29>:
80105c2c:	6a 00                	push   $0x0
80105c2e:	6a 1d                	push   $0x1d
80105c30:	e9 44 fa ff ff       	jmp    80105679 <alltraps>

80105c35 <vector30>:
80105c35:	6a 00                	push   $0x0
80105c37:	6a 1e                	push   $0x1e
80105c39:	e9 3b fa ff ff       	jmp    80105679 <alltraps>

80105c3e <vector31>:
80105c3e:	6a 00                	push   $0x0
80105c40:	6a 1f                	push   $0x1f
80105c42:	e9 32 fa ff ff       	jmp    80105679 <alltraps>

80105c47 <vector32>:
80105c47:	6a 00                	push   $0x0
80105c49:	6a 20                	push   $0x20
80105c4b:	e9 29 fa ff ff       	jmp    80105679 <alltraps>

80105c50 <vector33>:
80105c50:	6a 00                	push   $0x0
80105c52:	6a 21                	push   $0x21
80105c54:	e9 20 fa ff ff       	jmp    80105679 <alltraps>

80105c59 <vector34>:
80105c59:	6a 00                	push   $0x0
80105c5b:	6a 22                	push   $0x22
80105c5d:	e9 17 fa ff ff       	jmp    80105679 <alltraps>

80105c62 <vector35>:
80105c62:	6a 00                	push   $0x0
80105c64:	6a 23                	push   $0x23
80105c66:	e9 0e fa ff ff       	jmp    80105679 <alltraps>

80105c6b <vector36>:
80105c6b:	6a 00                	push   $0x0
80105c6d:	6a 24                	push   $0x24
80105c6f:	e9 05 fa ff ff       	jmp    80105679 <alltraps>

80105c74 <vector37>:
80105c74:	6a 00                	push   $0x0
80105c76:	6a 25                	push   $0x25
80105c78:	e9 fc f9 ff ff       	jmp    80105679 <alltraps>

80105c7d <vector38>:
80105c7d:	6a 00                	push   $0x0
80105c7f:	6a 26                	push   $0x26
80105c81:	e9 f3 f9 ff ff       	jmp    80105679 <alltraps>

80105c86 <vector39>:
80105c86:	6a 00                	push   $0x0
80105c88:	6a 27                	push   $0x27
80105c8a:	e9 ea f9 ff ff       	jmp    80105679 <alltraps>

80105c8f <vector40>:
80105c8f:	6a 00                	push   $0x0
80105c91:	6a 28                	push   $0x28
80105c93:	e9 e1 f9 ff ff       	jmp    80105679 <alltraps>

80105c98 <vector41>:
80105c98:	6a 00                	push   $0x0
80105c9a:	6a 29                	push   $0x29
80105c9c:	e9 d8 f9 ff ff       	jmp    80105679 <alltraps>

80105ca1 <vector42>:
80105ca1:	6a 00                	push   $0x0
80105ca3:	6a 2a                	push   $0x2a
80105ca5:	e9 cf f9 ff ff       	jmp    80105679 <alltraps>

80105caa <vector43>:
80105caa:	6a 00                	push   $0x0
80105cac:	6a 2b                	push   $0x2b
80105cae:	e9 c6 f9 ff ff       	jmp    80105679 <alltraps>

80105cb3 <vector44>:
80105cb3:	6a 00                	push   $0x0
80105cb5:	6a 2c                	push   $0x2c
80105cb7:	e9 bd f9 ff ff       	jmp    80105679 <alltraps>

80105cbc <vector45>:
80105cbc:	6a 00                	push   $0x0
80105cbe:	6a 2d                	push   $0x2d
80105cc0:	e9 b4 f9 ff ff       	jmp    80105679 <alltraps>

80105cc5 <vector46>:
80105cc5:	6a 00                	push   $0x0
80105cc7:	6a 2e                	push   $0x2e
80105cc9:	e9 ab f9 ff ff       	jmp    80105679 <alltraps>

80105cce <vector47>:
80105cce:	6a 00                	push   $0x0
80105cd0:	6a 2f                	push   $0x2f
80105cd2:	e9 a2 f9 ff ff       	jmp    80105679 <alltraps>

80105cd7 <vector48>:
80105cd7:	6a 00                	push   $0x0
80105cd9:	6a 30                	push   $0x30
80105cdb:	e9 99 f9 ff ff       	jmp    80105679 <alltraps>

80105ce0 <vector49>:
80105ce0:	6a 00                	push   $0x0
80105ce2:	6a 31                	push   $0x31
80105ce4:	e9 90 f9 ff ff       	jmp    80105679 <alltraps>

80105ce9 <vector50>:
80105ce9:	6a 00                	push   $0x0
80105ceb:	6a 32                	push   $0x32
80105ced:	e9 87 f9 ff ff       	jmp    80105679 <alltraps>

80105cf2 <vector51>:
80105cf2:	6a 00                	push   $0x0
80105cf4:	6a 33                	push   $0x33
80105cf6:	e9 7e f9 ff ff       	jmp    80105679 <alltraps>

80105cfb <vector52>:
80105cfb:	6a 00                	push   $0x0
80105cfd:	6a 34                	push   $0x34
80105cff:	e9 75 f9 ff ff       	jmp    80105679 <alltraps>

80105d04 <vector53>:
80105d04:	6a 00                	push   $0x0
80105d06:	6a 35                	push   $0x35
80105d08:	e9 6c f9 ff ff       	jmp    80105679 <alltraps>

80105d0d <vector54>:
80105d0d:	6a 00                	push   $0x0
80105d0f:	6a 36                	push   $0x36
80105d11:	e9 63 f9 ff ff       	jmp    80105679 <alltraps>

80105d16 <vector55>:
80105d16:	6a 00                	push   $0x0
80105d18:	6a 37                	push   $0x37
80105d1a:	e9 5a f9 ff ff       	jmp    80105679 <alltraps>

80105d1f <vector56>:
80105d1f:	6a 00                	push   $0x0
80105d21:	6a 38                	push   $0x38
80105d23:	e9 51 f9 ff ff       	jmp    80105679 <alltraps>

80105d28 <vector57>:
80105d28:	6a 00                	push   $0x0
80105d2a:	6a 39                	push   $0x39
80105d2c:	e9 48 f9 ff ff       	jmp    80105679 <alltraps>

80105d31 <vector58>:
80105d31:	6a 00                	push   $0x0
80105d33:	6a 3a                	push   $0x3a
80105d35:	e9 3f f9 ff ff       	jmp    80105679 <alltraps>

80105d3a <vector59>:
80105d3a:	6a 00                	push   $0x0
80105d3c:	6a 3b                	push   $0x3b
80105d3e:	e9 36 f9 ff ff       	jmp    80105679 <alltraps>

80105d43 <vector60>:
80105d43:	6a 00                	push   $0x0
80105d45:	6a 3c                	push   $0x3c
80105d47:	e9 2d f9 ff ff       	jmp    80105679 <alltraps>

80105d4c <vector61>:
80105d4c:	6a 00                	push   $0x0
80105d4e:	6a 3d                	push   $0x3d
80105d50:	e9 24 f9 ff ff       	jmp    80105679 <alltraps>

80105d55 <vector62>:
80105d55:	6a 00                	push   $0x0
80105d57:	6a 3e                	push   $0x3e
80105d59:	e9 1b f9 ff ff       	jmp    80105679 <alltraps>

80105d5e <vector63>:
80105d5e:	6a 00                	push   $0x0
80105d60:	6a 3f                	push   $0x3f
80105d62:	e9 12 f9 ff ff       	jmp    80105679 <alltraps>

80105d67 <vector64>:
80105d67:	6a 00                	push   $0x0
80105d69:	6a 40                	push   $0x40
80105d6b:	e9 09 f9 ff ff       	jmp    80105679 <alltraps>

80105d70 <vector65>:
80105d70:	6a 00                	push   $0x0
80105d72:	6a 41                	push   $0x41
80105d74:	e9 00 f9 ff ff       	jmp    80105679 <alltraps>

80105d79 <vector66>:
80105d79:	6a 00                	push   $0x0
80105d7b:	6a 42                	push   $0x42
80105d7d:	e9 f7 f8 ff ff       	jmp    80105679 <alltraps>

80105d82 <vector67>:
80105d82:	6a 00                	push   $0x0
80105d84:	6a 43                	push   $0x43
80105d86:	e9 ee f8 ff ff       	jmp    80105679 <alltraps>

80105d8b <vector68>:
80105d8b:	6a 00                	push   $0x0
80105d8d:	6a 44                	push   $0x44
80105d8f:	e9 e5 f8 ff ff       	jmp    80105679 <alltraps>

80105d94 <vector69>:
80105d94:	6a 00                	push   $0x0
80105d96:	6a 45                	push   $0x45
80105d98:	e9 dc f8 ff ff       	jmp    80105679 <alltraps>

80105d9d <vector70>:
80105d9d:	6a 00                	push   $0x0
80105d9f:	6a 46                	push   $0x46
80105da1:	e9 d3 f8 ff ff       	jmp    80105679 <alltraps>

80105da6 <vector71>:
80105da6:	6a 00                	push   $0x0
80105da8:	6a 47                	push   $0x47
80105daa:	e9 ca f8 ff ff       	jmp    80105679 <alltraps>

80105daf <vector72>:
80105daf:	6a 00                	push   $0x0
80105db1:	6a 48                	push   $0x48
80105db3:	e9 c1 f8 ff ff       	jmp    80105679 <alltraps>

80105db8 <vector73>:
80105db8:	6a 00                	push   $0x0
80105dba:	6a 49                	push   $0x49
80105dbc:	e9 b8 f8 ff ff       	jmp    80105679 <alltraps>

80105dc1 <vector74>:
80105dc1:	6a 00                	push   $0x0
80105dc3:	6a 4a                	push   $0x4a
80105dc5:	e9 af f8 ff ff       	jmp    80105679 <alltraps>

80105dca <vector75>:
80105dca:	6a 00                	push   $0x0
80105dcc:	6a 4b                	push   $0x4b
80105dce:	e9 a6 f8 ff ff       	jmp    80105679 <alltraps>

80105dd3 <vector76>:
80105dd3:	6a 00                	push   $0x0
80105dd5:	6a 4c                	push   $0x4c
80105dd7:	e9 9d f8 ff ff       	jmp    80105679 <alltraps>

80105ddc <vector77>:
80105ddc:	6a 00                	push   $0x0
80105dde:	6a 4d                	push   $0x4d
80105de0:	e9 94 f8 ff ff       	jmp    80105679 <alltraps>

80105de5 <vector78>:
80105de5:	6a 00                	push   $0x0
80105de7:	6a 4e                	push   $0x4e
80105de9:	e9 8b f8 ff ff       	jmp    80105679 <alltraps>

80105dee <vector79>:
80105dee:	6a 00                	push   $0x0
80105df0:	6a 4f                	push   $0x4f
80105df2:	e9 82 f8 ff ff       	jmp    80105679 <alltraps>

80105df7 <vector80>:
80105df7:	6a 00                	push   $0x0
80105df9:	6a 50                	push   $0x50
80105dfb:	e9 79 f8 ff ff       	jmp    80105679 <alltraps>

80105e00 <vector81>:
80105e00:	6a 00                	push   $0x0
80105e02:	6a 51                	push   $0x51
80105e04:	e9 70 f8 ff ff       	jmp    80105679 <alltraps>

80105e09 <vector82>:
80105e09:	6a 00                	push   $0x0
80105e0b:	6a 52                	push   $0x52
80105e0d:	e9 67 f8 ff ff       	jmp    80105679 <alltraps>

80105e12 <vector83>:
80105e12:	6a 00                	push   $0x0
80105e14:	6a 53                	push   $0x53
80105e16:	e9 5e f8 ff ff       	jmp    80105679 <alltraps>

80105e1b <vector84>:
80105e1b:	6a 00                	push   $0x0
80105e1d:	6a 54                	push   $0x54
80105e1f:	e9 55 f8 ff ff       	jmp    80105679 <alltraps>

80105e24 <vector85>:
80105e24:	6a 00                	push   $0x0
80105e26:	6a 55                	push   $0x55
80105e28:	e9 4c f8 ff ff       	jmp    80105679 <alltraps>

80105e2d <vector86>:
80105e2d:	6a 00                	push   $0x0
80105e2f:	6a 56                	push   $0x56
80105e31:	e9 43 f8 ff ff       	jmp    80105679 <alltraps>

80105e36 <vector87>:
80105e36:	6a 00                	push   $0x0
80105e38:	6a 57                	push   $0x57
80105e3a:	e9 3a f8 ff ff       	jmp    80105679 <alltraps>

80105e3f <vector88>:
80105e3f:	6a 00                	push   $0x0
80105e41:	6a 58                	push   $0x58
80105e43:	e9 31 f8 ff ff       	jmp    80105679 <alltraps>

80105e48 <vector89>:
80105e48:	6a 00                	push   $0x0
80105e4a:	6a 59                	push   $0x59
80105e4c:	e9 28 f8 ff ff       	jmp    80105679 <alltraps>

80105e51 <vector90>:
80105e51:	6a 00                	push   $0x0
80105e53:	6a 5a                	push   $0x5a
80105e55:	e9 1f f8 ff ff       	jmp    80105679 <alltraps>

80105e5a <vector91>:
80105e5a:	6a 00                	push   $0x0
80105e5c:	6a 5b                	push   $0x5b
80105e5e:	e9 16 f8 ff ff       	jmp    80105679 <alltraps>

80105e63 <vector92>:
80105e63:	6a 00                	push   $0x0
80105e65:	6a 5c                	push   $0x5c
80105e67:	e9 0d f8 ff ff       	jmp    80105679 <alltraps>

80105e6c <vector93>:
80105e6c:	6a 00                	push   $0x0
80105e6e:	6a 5d                	push   $0x5d
80105e70:	e9 04 f8 ff ff       	jmp    80105679 <alltraps>

80105e75 <vector94>:
80105e75:	6a 00                	push   $0x0
80105e77:	6a 5e                	push   $0x5e
80105e79:	e9 fb f7 ff ff       	jmp    80105679 <alltraps>

80105e7e <vector95>:
80105e7e:	6a 00                	push   $0x0
80105e80:	6a 5f                	push   $0x5f
80105e82:	e9 f2 f7 ff ff       	jmp    80105679 <alltraps>

80105e87 <vector96>:
80105e87:	6a 00                	push   $0x0
80105e89:	6a 60                	push   $0x60
80105e8b:	e9 e9 f7 ff ff       	jmp    80105679 <alltraps>

80105e90 <vector97>:
80105e90:	6a 00                	push   $0x0
80105e92:	6a 61                	push   $0x61
80105e94:	e9 e0 f7 ff ff       	jmp    80105679 <alltraps>

80105e99 <vector98>:
80105e99:	6a 00                	push   $0x0
80105e9b:	6a 62                	push   $0x62
80105e9d:	e9 d7 f7 ff ff       	jmp    80105679 <alltraps>

80105ea2 <vector99>:
80105ea2:	6a 00                	push   $0x0
80105ea4:	6a 63                	push   $0x63
80105ea6:	e9 ce f7 ff ff       	jmp    80105679 <alltraps>

80105eab <vector100>:
80105eab:	6a 00                	push   $0x0
80105ead:	6a 64                	push   $0x64
80105eaf:	e9 c5 f7 ff ff       	jmp    80105679 <alltraps>

80105eb4 <vector101>:
80105eb4:	6a 00                	push   $0x0
80105eb6:	6a 65                	push   $0x65
80105eb8:	e9 bc f7 ff ff       	jmp    80105679 <alltraps>

80105ebd <vector102>:
80105ebd:	6a 00                	push   $0x0
80105ebf:	6a 66                	push   $0x66
80105ec1:	e9 b3 f7 ff ff       	jmp    80105679 <alltraps>

80105ec6 <vector103>:
80105ec6:	6a 00                	push   $0x0
80105ec8:	6a 67                	push   $0x67
80105eca:	e9 aa f7 ff ff       	jmp    80105679 <alltraps>

80105ecf <vector104>:
80105ecf:	6a 00                	push   $0x0
80105ed1:	6a 68                	push   $0x68
80105ed3:	e9 a1 f7 ff ff       	jmp    80105679 <alltraps>

80105ed8 <vector105>:
80105ed8:	6a 00                	push   $0x0
80105eda:	6a 69                	push   $0x69
80105edc:	e9 98 f7 ff ff       	jmp    80105679 <alltraps>

80105ee1 <vector106>:
80105ee1:	6a 00                	push   $0x0
80105ee3:	6a 6a                	push   $0x6a
80105ee5:	e9 8f f7 ff ff       	jmp    80105679 <alltraps>

80105eea <vector107>:
80105eea:	6a 00                	push   $0x0
80105eec:	6a 6b                	push   $0x6b
80105eee:	e9 86 f7 ff ff       	jmp    80105679 <alltraps>

80105ef3 <vector108>:
80105ef3:	6a 00                	push   $0x0
80105ef5:	6a 6c                	push   $0x6c
80105ef7:	e9 7d f7 ff ff       	jmp    80105679 <alltraps>

80105efc <vector109>:
80105efc:	6a 00                	push   $0x0
80105efe:	6a 6d                	push   $0x6d
80105f00:	e9 74 f7 ff ff       	jmp    80105679 <alltraps>

80105f05 <vector110>:
80105f05:	6a 00                	push   $0x0
80105f07:	6a 6e                	push   $0x6e
80105f09:	e9 6b f7 ff ff       	jmp    80105679 <alltraps>

80105f0e <vector111>:
80105f0e:	6a 00                	push   $0x0
80105f10:	6a 6f                	push   $0x6f
80105f12:	e9 62 f7 ff ff       	jmp    80105679 <alltraps>

80105f17 <vector112>:
80105f17:	6a 00                	push   $0x0
80105f19:	6a 70                	push   $0x70
80105f1b:	e9 59 f7 ff ff       	jmp    80105679 <alltraps>

80105f20 <vector113>:
80105f20:	6a 00                	push   $0x0
80105f22:	6a 71                	push   $0x71
80105f24:	e9 50 f7 ff ff       	jmp    80105679 <alltraps>

80105f29 <vector114>:
80105f29:	6a 00                	push   $0x0
80105f2b:	6a 72                	push   $0x72
80105f2d:	e9 47 f7 ff ff       	jmp    80105679 <alltraps>

80105f32 <vector115>:
80105f32:	6a 00                	push   $0x0
80105f34:	6a 73                	push   $0x73
80105f36:	e9 3e f7 ff ff       	jmp    80105679 <alltraps>

80105f3b <vector116>:
80105f3b:	6a 00                	push   $0x0
80105f3d:	6a 74                	push   $0x74
80105f3f:	e9 35 f7 ff ff       	jmp    80105679 <alltraps>

80105f44 <vector117>:
80105f44:	6a 00                	push   $0x0
80105f46:	6a 75                	push   $0x75
80105f48:	e9 2c f7 ff ff       	jmp    80105679 <alltraps>

80105f4d <vector118>:
80105f4d:	6a 00                	push   $0x0
80105f4f:	6a 76                	push   $0x76
80105f51:	e9 23 f7 ff ff       	jmp    80105679 <alltraps>

80105f56 <vector119>:
80105f56:	6a 00                	push   $0x0
80105f58:	6a 77                	push   $0x77
80105f5a:	e9 1a f7 ff ff       	jmp    80105679 <alltraps>

80105f5f <vector120>:
80105f5f:	6a 00                	push   $0x0
80105f61:	6a 78                	push   $0x78
80105f63:	e9 11 f7 ff ff       	jmp    80105679 <alltraps>

80105f68 <vector121>:
80105f68:	6a 00                	push   $0x0
80105f6a:	6a 79                	push   $0x79
80105f6c:	e9 08 f7 ff ff       	jmp    80105679 <alltraps>

80105f71 <vector122>:
80105f71:	6a 00                	push   $0x0
80105f73:	6a 7a                	push   $0x7a
80105f75:	e9 ff f6 ff ff       	jmp    80105679 <alltraps>

80105f7a <vector123>:
80105f7a:	6a 00                	push   $0x0
80105f7c:	6a 7b                	push   $0x7b
80105f7e:	e9 f6 f6 ff ff       	jmp    80105679 <alltraps>

80105f83 <vector124>:
80105f83:	6a 00                	push   $0x0
80105f85:	6a 7c                	push   $0x7c
80105f87:	e9 ed f6 ff ff       	jmp    80105679 <alltraps>

80105f8c <vector125>:
80105f8c:	6a 00                	push   $0x0
80105f8e:	6a 7d                	push   $0x7d
80105f90:	e9 e4 f6 ff ff       	jmp    80105679 <alltraps>

80105f95 <vector126>:
80105f95:	6a 00                	push   $0x0
80105f97:	6a 7e                	push   $0x7e
80105f99:	e9 db f6 ff ff       	jmp    80105679 <alltraps>

80105f9e <vector127>:
80105f9e:	6a 00                	push   $0x0
80105fa0:	6a 7f                	push   $0x7f
80105fa2:	e9 d2 f6 ff ff       	jmp    80105679 <alltraps>

80105fa7 <vector128>:
80105fa7:	6a 00                	push   $0x0
80105fa9:	68 80 00 00 00       	push   $0x80
80105fae:	e9 c6 f6 ff ff       	jmp    80105679 <alltraps>

80105fb3 <vector129>:
80105fb3:	6a 00                	push   $0x0
80105fb5:	68 81 00 00 00       	push   $0x81
80105fba:	e9 ba f6 ff ff       	jmp    80105679 <alltraps>

80105fbf <vector130>:
80105fbf:	6a 00                	push   $0x0
80105fc1:	68 82 00 00 00       	push   $0x82
80105fc6:	e9 ae f6 ff ff       	jmp    80105679 <alltraps>

80105fcb <vector131>:
80105fcb:	6a 00                	push   $0x0
80105fcd:	68 83 00 00 00       	push   $0x83
80105fd2:	e9 a2 f6 ff ff       	jmp    80105679 <alltraps>

80105fd7 <vector132>:
80105fd7:	6a 00                	push   $0x0
80105fd9:	68 84 00 00 00       	push   $0x84
80105fde:	e9 96 f6 ff ff       	jmp    80105679 <alltraps>

80105fe3 <vector133>:
80105fe3:	6a 00                	push   $0x0
80105fe5:	68 85 00 00 00       	push   $0x85
80105fea:	e9 8a f6 ff ff       	jmp    80105679 <alltraps>

80105fef <vector134>:
80105fef:	6a 00                	push   $0x0
80105ff1:	68 86 00 00 00       	push   $0x86
80105ff6:	e9 7e f6 ff ff       	jmp    80105679 <alltraps>

80105ffb <vector135>:
80105ffb:	6a 00                	push   $0x0
80105ffd:	68 87 00 00 00       	push   $0x87
80106002:	e9 72 f6 ff ff       	jmp    80105679 <alltraps>

80106007 <vector136>:
80106007:	6a 00                	push   $0x0
80106009:	68 88 00 00 00       	push   $0x88
8010600e:	e9 66 f6 ff ff       	jmp    80105679 <alltraps>

80106013 <vector137>:
80106013:	6a 00                	push   $0x0
80106015:	68 89 00 00 00       	push   $0x89
8010601a:	e9 5a f6 ff ff       	jmp    80105679 <alltraps>

8010601f <vector138>:
8010601f:	6a 00                	push   $0x0
80106021:	68 8a 00 00 00       	push   $0x8a
80106026:	e9 4e f6 ff ff       	jmp    80105679 <alltraps>

8010602b <vector139>:
8010602b:	6a 00                	push   $0x0
8010602d:	68 8b 00 00 00       	push   $0x8b
80106032:	e9 42 f6 ff ff       	jmp    80105679 <alltraps>

80106037 <vector140>:
80106037:	6a 00                	push   $0x0
80106039:	68 8c 00 00 00       	push   $0x8c
8010603e:	e9 36 f6 ff ff       	jmp    80105679 <alltraps>

80106043 <vector141>:
80106043:	6a 00                	push   $0x0
80106045:	68 8d 00 00 00       	push   $0x8d
8010604a:	e9 2a f6 ff ff       	jmp    80105679 <alltraps>

8010604f <vector142>:
8010604f:	6a 00                	push   $0x0
80106051:	68 8e 00 00 00       	push   $0x8e
80106056:	e9 1e f6 ff ff       	jmp    80105679 <alltraps>

8010605b <vector143>:
8010605b:	6a 00                	push   $0x0
8010605d:	68 8f 00 00 00       	push   $0x8f
80106062:	e9 12 f6 ff ff       	jmp    80105679 <alltraps>

80106067 <vector144>:
80106067:	6a 00                	push   $0x0
80106069:	68 90 00 00 00       	push   $0x90
8010606e:	e9 06 f6 ff ff       	jmp    80105679 <alltraps>

80106073 <vector145>:
80106073:	6a 00                	push   $0x0
80106075:	68 91 00 00 00       	push   $0x91
8010607a:	e9 fa f5 ff ff       	jmp    80105679 <alltraps>

8010607f <vector146>:
8010607f:	6a 00                	push   $0x0
80106081:	68 92 00 00 00       	push   $0x92
80106086:	e9 ee f5 ff ff       	jmp    80105679 <alltraps>

8010608b <vector147>:
8010608b:	6a 00                	push   $0x0
8010608d:	68 93 00 00 00       	push   $0x93
80106092:	e9 e2 f5 ff ff       	jmp    80105679 <alltraps>

80106097 <vector148>:
80106097:	6a 00                	push   $0x0
80106099:	68 94 00 00 00       	push   $0x94
8010609e:	e9 d6 f5 ff ff       	jmp    80105679 <alltraps>

801060a3 <vector149>:
801060a3:	6a 00                	push   $0x0
801060a5:	68 95 00 00 00       	push   $0x95
801060aa:	e9 ca f5 ff ff       	jmp    80105679 <alltraps>

801060af <vector150>:
801060af:	6a 00                	push   $0x0
801060b1:	68 96 00 00 00       	push   $0x96
801060b6:	e9 be f5 ff ff       	jmp    80105679 <alltraps>

801060bb <vector151>:
801060bb:	6a 00                	push   $0x0
801060bd:	68 97 00 00 00       	push   $0x97
801060c2:	e9 b2 f5 ff ff       	jmp    80105679 <alltraps>

801060c7 <vector152>:
801060c7:	6a 00                	push   $0x0
801060c9:	68 98 00 00 00       	push   $0x98
801060ce:	e9 a6 f5 ff ff       	jmp    80105679 <alltraps>

801060d3 <vector153>:
801060d3:	6a 00                	push   $0x0
801060d5:	68 99 00 00 00       	push   $0x99
801060da:	e9 9a f5 ff ff       	jmp    80105679 <alltraps>

801060df <vector154>:
801060df:	6a 00                	push   $0x0
801060e1:	68 9a 00 00 00       	push   $0x9a
801060e6:	e9 8e f5 ff ff       	jmp    80105679 <alltraps>

801060eb <vector155>:
801060eb:	6a 00                	push   $0x0
801060ed:	68 9b 00 00 00       	push   $0x9b
801060f2:	e9 82 f5 ff ff       	jmp    80105679 <alltraps>

801060f7 <vector156>:
801060f7:	6a 00                	push   $0x0
801060f9:	68 9c 00 00 00       	push   $0x9c
801060fe:	e9 76 f5 ff ff       	jmp    80105679 <alltraps>

80106103 <vector157>:
80106103:	6a 00                	push   $0x0
80106105:	68 9d 00 00 00       	push   $0x9d
8010610a:	e9 6a f5 ff ff       	jmp    80105679 <alltraps>

8010610f <vector158>:
8010610f:	6a 00                	push   $0x0
80106111:	68 9e 00 00 00       	push   $0x9e
80106116:	e9 5e f5 ff ff       	jmp    80105679 <alltraps>

8010611b <vector159>:
8010611b:	6a 00                	push   $0x0
8010611d:	68 9f 00 00 00       	push   $0x9f
80106122:	e9 52 f5 ff ff       	jmp    80105679 <alltraps>

80106127 <vector160>:
80106127:	6a 00                	push   $0x0
80106129:	68 a0 00 00 00       	push   $0xa0
8010612e:	e9 46 f5 ff ff       	jmp    80105679 <alltraps>

80106133 <vector161>:
80106133:	6a 00                	push   $0x0
80106135:	68 a1 00 00 00       	push   $0xa1
8010613a:	e9 3a f5 ff ff       	jmp    80105679 <alltraps>

8010613f <vector162>:
8010613f:	6a 00                	push   $0x0
80106141:	68 a2 00 00 00       	push   $0xa2
80106146:	e9 2e f5 ff ff       	jmp    80105679 <alltraps>

8010614b <vector163>:
8010614b:	6a 00                	push   $0x0
8010614d:	68 a3 00 00 00       	push   $0xa3
80106152:	e9 22 f5 ff ff       	jmp    80105679 <alltraps>

80106157 <vector164>:
80106157:	6a 00                	push   $0x0
80106159:	68 a4 00 00 00       	push   $0xa4
8010615e:	e9 16 f5 ff ff       	jmp    80105679 <alltraps>

80106163 <vector165>:
80106163:	6a 00                	push   $0x0
80106165:	68 a5 00 00 00       	push   $0xa5
8010616a:	e9 0a f5 ff ff       	jmp    80105679 <alltraps>

8010616f <vector166>:
8010616f:	6a 00                	push   $0x0
80106171:	68 a6 00 00 00       	push   $0xa6
80106176:	e9 fe f4 ff ff       	jmp    80105679 <alltraps>

8010617b <vector167>:
8010617b:	6a 00                	push   $0x0
8010617d:	68 a7 00 00 00       	push   $0xa7
80106182:	e9 f2 f4 ff ff       	jmp    80105679 <alltraps>

80106187 <vector168>:
80106187:	6a 00                	push   $0x0
80106189:	68 a8 00 00 00       	push   $0xa8
8010618e:	e9 e6 f4 ff ff       	jmp    80105679 <alltraps>

80106193 <vector169>:
80106193:	6a 00                	push   $0x0
80106195:	68 a9 00 00 00       	push   $0xa9
8010619a:	e9 da f4 ff ff       	jmp    80105679 <alltraps>

8010619f <vector170>:
8010619f:	6a 00                	push   $0x0
801061a1:	68 aa 00 00 00       	push   $0xaa
801061a6:	e9 ce f4 ff ff       	jmp    80105679 <alltraps>

801061ab <vector171>:
801061ab:	6a 00                	push   $0x0
801061ad:	68 ab 00 00 00       	push   $0xab
801061b2:	e9 c2 f4 ff ff       	jmp    80105679 <alltraps>

801061b7 <vector172>:
801061b7:	6a 00                	push   $0x0
801061b9:	68 ac 00 00 00       	push   $0xac
801061be:	e9 b6 f4 ff ff       	jmp    80105679 <alltraps>

801061c3 <vector173>:
801061c3:	6a 00                	push   $0x0
801061c5:	68 ad 00 00 00       	push   $0xad
801061ca:	e9 aa f4 ff ff       	jmp    80105679 <alltraps>

801061cf <vector174>:
801061cf:	6a 00                	push   $0x0
801061d1:	68 ae 00 00 00       	push   $0xae
801061d6:	e9 9e f4 ff ff       	jmp    80105679 <alltraps>

801061db <vector175>:
801061db:	6a 00                	push   $0x0
801061dd:	68 af 00 00 00       	push   $0xaf
801061e2:	e9 92 f4 ff ff       	jmp    80105679 <alltraps>

801061e7 <vector176>:
801061e7:	6a 00                	push   $0x0
801061e9:	68 b0 00 00 00       	push   $0xb0
801061ee:	e9 86 f4 ff ff       	jmp    80105679 <alltraps>

801061f3 <vector177>:
801061f3:	6a 00                	push   $0x0
801061f5:	68 b1 00 00 00       	push   $0xb1
801061fa:	e9 7a f4 ff ff       	jmp    80105679 <alltraps>

801061ff <vector178>:
801061ff:	6a 00                	push   $0x0
80106201:	68 b2 00 00 00       	push   $0xb2
80106206:	e9 6e f4 ff ff       	jmp    80105679 <alltraps>

8010620b <vector179>:
8010620b:	6a 00                	push   $0x0
8010620d:	68 b3 00 00 00       	push   $0xb3
80106212:	e9 62 f4 ff ff       	jmp    80105679 <alltraps>

80106217 <vector180>:
80106217:	6a 00                	push   $0x0
80106219:	68 b4 00 00 00       	push   $0xb4
8010621e:	e9 56 f4 ff ff       	jmp    80105679 <alltraps>

80106223 <vector181>:
80106223:	6a 00                	push   $0x0
80106225:	68 b5 00 00 00       	push   $0xb5
8010622a:	e9 4a f4 ff ff       	jmp    80105679 <alltraps>

8010622f <vector182>:
8010622f:	6a 00                	push   $0x0
80106231:	68 b6 00 00 00       	push   $0xb6
80106236:	e9 3e f4 ff ff       	jmp    80105679 <alltraps>

8010623b <vector183>:
8010623b:	6a 00                	push   $0x0
8010623d:	68 b7 00 00 00       	push   $0xb7
80106242:	e9 32 f4 ff ff       	jmp    80105679 <alltraps>

80106247 <vector184>:
80106247:	6a 00                	push   $0x0
80106249:	68 b8 00 00 00       	push   $0xb8
8010624e:	e9 26 f4 ff ff       	jmp    80105679 <alltraps>

80106253 <vector185>:
80106253:	6a 00                	push   $0x0
80106255:	68 b9 00 00 00       	push   $0xb9
8010625a:	e9 1a f4 ff ff       	jmp    80105679 <alltraps>

8010625f <vector186>:
8010625f:	6a 00                	push   $0x0
80106261:	68 ba 00 00 00       	push   $0xba
80106266:	e9 0e f4 ff ff       	jmp    80105679 <alltraps>

8010626b <vector187>:
8010626b:	6a 00                	push   $0x0
8010626d:	68 bb 00 00 00       	push   $0xbb
80106272:	e9 02 f4 ff ff       	jmp    80105679 <alltraps>

80106277 <vector188>:
80106277:	6a 00                	push   $0x0
80106279:	68 bc 00 00 00       	push   $0xbc
8010627e:	e9 f6 f3 ff ff       	jmp    80105679 <alltraps>

80106283 <vector189>:
80106283:	6a 00                	push   $0x0
80106285:	68 bd 00 00 00       	push   $0xbd
8010628a:	e9 ea f3 ff ff       	jmp    80105679 <alltraps>

8010628f <vector190>:
8010628f:	6a 00                	push   $0x0
80106291:	68 be 00 00 00       	push   $0xbe
80106296:	e9 de f3 ff ff       	jmp    80105679 <alltraps>

8010629b <vector191>:
8010629b:	6a 00                	push   $0x0
8010629d:	68 bf 00 00 00       	push   $0xbf
801062a2:	e9 d2 f3 ff ff       	jmp    80105679 <alltraps>

801062a7 <vector192>:
801062a7:	6a 00                	push   $0x0
801062a9:	68 c0 00 00 00       	push   $0xc0
801062ae:	e9 c6 f3 ff ff       	jmp    80105679 <alltraps>

801062b3 <vector193>:
801062b3:	6a 00                	push   $0x0
801062b5:	68 c1 00 00 00       	push   $0xc1
801062ba:	e9 ba f3 ff ff       	jmp    80105679 <alltraps>

801062bf <vector194>:
801062bf:	6a 00                	push   $0x0
801062c1:	68 c2 00 00 00       	push   $0xc2
801062c6:	e9 ae f3 ff ff       	jmp    80105679 <alltraps>

801062cb <vector195>:
801062cb:	6a 00                	push   $0x0
801062cd:	68 c3 00 00 00       	push   $0xc3
801062d2:	e9 a2 f3 ff ff       	jmp    80105679 <alltraps>

801062d7 <vector196>:
801062d7:	6a 00                	push   $0x0
801062d9:	68 c4 00 00 00       	push   $0xc4
801062de:	e9 96 f3 ff ff       	jmp    80105679 <alltraps>

801062e3 <vector197>:
801062e3:	6a 00                	push   $0x0
801062e5:	68 c5 00 00 00       	push   $0xc5
801062ea:	e9 8a f3 ff ff       	jmp    80105679 <alltraps>

801062ef <vector198>:
801062ef:	6a 00                	push   $0x0
801062f1:	68 c6 00 00 00       	push   $0xc6
801062f6:	e9 7e f3 ff ff       	jmp    80105679 <alltraps>

801062fb <vector199>:
801062fb:	6a 00                	push   $0x0
801062fd:	68 c7 00 00 00       	push   $0xc7
80106302:	e9 72 f3 ff ff       	jmp    80105679 <alltraps>

80106307 <vector200>:
80106307:	6a 00                	push   $0x0
80106309:	68 c8 00 00 00       	push   $0xc8
8010630e:	e9 66 f3 ff ff       	jmp    80105679 <alltraps>

80106313 <vector201>:
80106313:	6a 00                	push   $0x0
80106315:	68 c9 00 00 00       	push   $0xc9
8010631a:	e9 5a f3 ff ff       	jmp    80105679 <alltraps>

8010631f <vector202>:
8010631f:	6a 00                	push   $0x0
80106321:	68 ca 00 00 00       	push   $0xca
80106326:	e9 4e f3 ff ff       	jmp    80105679 <alltraps>

8010632b <vector203>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 cb 00 00 00       	push   $0xcb
80106332:	e9 42 f3 ff ff       	jmp    80105679 <alltraps>

80106337 <vector204>:
80106337:	6a 00                	push   $0x0
80106339:	68 cc 00 00 00       	push   $0xcc
8010633e:	e9 36 f3 ff ff       	jmp    80105679 <alltraps>

80106343 <vector205>:
80106343:	6a 00                	push   $0x0
80106345:	68 cd 00 00 00       	push   $0xcd
8010634a:	e9 2a f3 ff ff       	jmp    80105679 <alltraps>

8010634f <vector206>:
8010634f:	6a 00                	push   $0x0
80106351:	68 ce 00 00 00       	push   $0xce
80106356:	e9 1e f3 ff ff       	jmp    80105679 <alltraps>

8010635b <vector207>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 cf 00 00 00       	push   $0xcf
80106362:	e9 12 f3 ff ff       	jmp    80105679 <alltraps>

80106367 <vector208>:
80106367:	6a 00                	push   $0x0
80106369:	68 d0 00 00 00       	push   $0xd0
8010636e:	e9 06 f3 ff ff       	jmp    80105679 <alltraps>

80106373 <vector209>:
80106373:	6a 00                	push   $0x0
80106375:	68 d1 00 00 00       	push   $0xd1
8010637a:	e9 fa f2 ff ff       	jmp    80105679 <alltraps>

8010637f <vector210>:
8010637f:	6a 00                	push   $0x0
80106381:	68 d2 00 00 00       	push   $0xd2
80106386:	e9 ee f2 ff ff       	jmp    80105679 <alltraps>

8010638b <vector211>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 d3 00 00 00       	push   $0xd3
80106392:	e9 e2 f2 ff ff       	jmp    80105679 <alltraps>

80106397 <vector212>:
80106397:	6a 00                	push   $0x0
80106399:	68 d4 00 00 00       	push   $0xd4
8010639e:	e9 d6 f2 ff ff       	jmp    80105679 <alltraps>

801063a3 <vector213>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 d5 00 00 00       	push   $0xd5
801063aa:	e9 ca f2 ff ff       	jmp    80105679 <alltraps>

801063af <vector214>:
801063af:	6a 00                	push   $0x0
801063b1:	68 d6 00 00 00       	push   $0xd6
801063b6:	e9 be f2 ff ff       	jmp    80105679 <alltraps>

801063bb <vector215>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 d7 00 00 00       	push   $0xd7
801063c2:	e9 b2 f2 ff ff       	jmp    80105679 <alltraps>

801063c7 <vector216>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 d8 00 00 00       	push   $0xd8
801063ce:	e9 a6 f2 ff ff       	jmp    80105679 <alltraps>

801063d3 <vector217>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 d9 00 00 00       	push   $0xd9
801063da:	e9 9a f2 ff ff       	jmp    80105679 <alltraps>

801063df <vector218>:
801063df:	6a 00                	push   $0x0
801063e1:	68 da 00 00 00       	push   $0xda
801063e6:	e9 8e f2 ff ff       	jmp    80105679 <alltraps>

801063eb <vector219>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 db 00 00 00       	push   $0xdb
801063f2:	e9 82 f2 ff ff       	jmp    80105679 <alltraps>

801063f7 <vector220>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 dc 00 00 00       	push   $0xdc
801063fe:	e9 76 f2 ff ff       	jmp    80105679 <alltraps>

80106403 <vector221>:
80106403:	6a 00                	push   $0x0
80106405:	68 dd 00 00 00       	push   $0xdd
8010640a:	e9 6a f2 ff ff       	jmp    80105679 <alltraps>

8010640f <vector222>:
8010640f:	6a 00                	push   $0x0
80106411:	68 de 00 00 00       	push   $0xde
80106416:	e9 5e f2 ff ff       	jmp    80105679 <alltraps>

8010641b <vector223>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 df 00 00 00       	push   $0xdf
80106422:	e9 52 f2 ff ff       	jmp    80105679 <alltraps>

80106427 <vector224>:
80106427:	6a 00                	push   $0x0
80106429:	68 e0 00 00 00       	push   $0xe0
8010642e:	e9 46 f2 ff ff       	jmp    80105679 <alltraps>

80106433 <vector225>:
80106433:	6a 00                	push   $0x0
80106435:	68 e1 00 00 00       	push   $0xe1
8010643a:	e9 3a f2 ff ff       	jmp    80105679 <alltraps>

8010643f <vector226>:
8010643f:	6a 00                	push   $0x0
80106441:	68 e2 00 00 00       	push   $0xe2
80106446:	e9 2e f2 ff ff       	jmp    80105679 <alltraps>

8010644b <vector227>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 e3 00 00 00       	push   $0xe3
80106452:	e9 22 f2 ff ff       	jmp    80105679 <alltraps>

80106457 <vector228>:
80106457:	6a 00                	push   $0x0
80106459:	68 e4 00 00 00       	push   $0xe4
8010645e:	e9 16 f2 ff ff       	jmp    80105679 <alltraps>

80106463 <vector229>:
80106463:	6a 00                	push   $0x0
80106465:	68 e5 00 00 00       	push   $0xe5
8010646a:	e9 0a f2 ff ff       	jmp    80105679 <alltraps>

8010646f <vector230>:
8010646f:	6a 00                	push   $0x0
80106471:	68 e6 00 00 00       	push   $0xe6
80106476:	e9 fe f1 ff ff       	jmp    80105679 <alltraps>

8010647b <vector231>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 e7 00 00 00       	push   $0xe7
80106482:	e9 f2 f1 ff ff       	jmp    80105679 <alltraps>

80106487 <vector232>:
80106487:	6a 00                	push   $0x0
80106489:	68 e8 00 00 00       	push   $0xe8
8010648e:	e9 e6 f1 ff ff       	jmp    80105679 <alltraps>

80106493 <vector233>:
80106493:	6a 00                	push   $0x0
80106495:	68 e9 00 00 00       	push   $0xe9
8010649a:	e9 da f1 ff ff       	jmp    80105679 <alltraps>

8010649f <vector234>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 ea 00 00 00       	push   $0xea
801064a6:	e9 ce f1 ff ff       	jmp    80105679 <alltraps>

801064ab <vector235>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 eb 00 00 00       	push   $0xeb
801064b2:	e9 c2 f1 ff ff       	jmp    80105679 <alltraps>

801064b7 <vector236>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 ec 00 00 00       	push   $0xec
801064be:	e9 b6 f1 ff ff       	jmp    80105679 <alltraps>

801064c3 <vector237>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 ed 00 00 00       	push   $0xed
801064ca:	e9 aa f1 ff ff       	jmp    80105679 <alltraps>

801064cf <vector238>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 ee 00 00 00       	push   $0xee
801064d6:	e9 9e f1 ff ff       	jmp    80105679 <alltraps>

801064db <vector239>:
801064db:	6a 00                	push   $0x0
801064dd:	68 ef 00 00 00       	push   $0xef
801064e2:	e9 92 f1 ff ff       	jmp    80105679 <alltraps>

801064e7 <vector240>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 f0 00 00 00       	push   $0xf0
801064ee:	e9 86 f1 ff ff       	jmp    80105679 <alltraps>

801064f3 <vector241>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 f1 00 00 00       	push   $0xf1
801064fa:	e9 7a f1 ff ff       	jmp    80105679 <alltraps>

801064ff <vector242>:
801064ff:	6a 00                	push   $0x0
80106501:	68 f2 00 00 00       	push   $0xf2
80106506:	e9 6e f1 ff ff       	jmp    80105679 <alltraps>

8010650b <vector243>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 f3 00 00 00       	push   $0xf3
80106512:	e9 62 f1 ff ff       	jmp    80105679 <alltraps>

80106517 <vector244>:
80106517:	6a 00                	push   $0x0
80106519:	68 f4 00 00 00       	push   $0xf4
8010651e:	e9 56 f1 ff ff       	jmp    80105679 <alltraps>

80106523 <vector245>:
80106523:	6a 00                	push   $0x0
80106525:	68 f5 00 00 00       	push   $0xf5
8010652a:	e9 4a f1 ff ff       	jmp    80105679 <alltraps>

8010652f <vector246>:
8010652f:	6a 00                	push   $0x0
80106531:	68 f6 00 00 00       	push   $0xf6
80106536:	e9 3e f1 ff ff       	jmp    80105679 <alltraps>

8010653b <vector247>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 f7 00 00 00       	push   $0xf7
80106542:	e9 32 f1 ff ff       	jmp    80105679 <alltraps>

80106547 <vector248>:
80106547:	6a 00                	push   $0x0
80106549:	68 f8 00 00 00       	push   $0xf8
8010654e:	e9 26 f1 ff ff       	jmp    80105679 <alltraps>

80106553 <vector249>:
80106553:	6a 00                	push   $0x0
80106555:	68 f9 00 00 00       	push   $0xf9
8010655a:	e9 1a f1 ff ff       	jmp    80105679 <alltraps>

8010655f <vector250>:
8010655f:	6a 00                	push   $0x0
80106561:	68 fa 00 00 00       	push   $0xfa
80106566:	e9 0e f1 ff ff       	jmp    80105679 <alltraps>

8010656b <vector251>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 fb 00 00 00       	push   $0xfb
80106572:	e9 02 f1 ff ff       	jmp    80105679 <alltraps>

80106577 <vector252>:
80106577:	6a 00                	push   $0x0
80106579:	68 fc 00 00 00       	push   $0xfc
8010657e:	e9 f6 f0 ff ff       	jmp    80105679 <alltraps>

80106583 <vector253>:
80106583:	6a 00                	push   $0x0
80106585:	68 fd 00 00 00       	push   $0xfd
8010658a:	e9 ea f0 ff ff       	jmp    80105679 <alltraps>

8010658f <vector254>:
8010658f:	6a 00                	push   $0x0
80106591:	68 fe 00 00 00       	push   $0xfe
80106596:	e9 de f0 ff ff       	jmp    80105679 <alltraps>

8010659b <vector255>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 ff 00 00 00       	push   $0xff
801065a2:	e9 d2 f0 ff ff       	jmp    80105679 <alltraps>
801065a7:	66 90                	xchg   %ax,%ax
801065a9:	66 90                	xchg   %ax,%ax
801065ab:	66 90                	xchg   %ax,%ax
801065ad:	66 90                	xchg   %ax,%ax
801065af:	90                   	nop

801065b0 <walkpgdir>:
801065b0:	55                   	push   %ebp
801065b1:	89 e5                	mov    %esp,%ebp
801065b3:	57                   	push   %edi
801065b4:	56                   	push   %esi
801065b5:	53                   	push   %ebx
801065b6:	89 d3                	mov    %edx,%ebx
801065b8:	c1 ea 16             	shr    $0x16,%edx
801065bb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
801065be:	83 ec 0c             	sub    $0xc,%esp
801065c1:	8b 07                	mov    (%edi),%eax
801065c3:	a8 01                	test   $0x1,%al
801065c5:	74 29                	je     801065f0 <walkpgdir+0x40>
801065c7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801065cc:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801065d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
801065d5:	c1 eb 0a             	shr    $0xa,%ebx
801065d8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
801065de:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
801065e1:	5b                   	pop    %ebx
801065e2:	5e                   	pop    %esi
801065e3:	5f                   	pop    %edi
801065e4:	5d                   	pop    %ebp
801065e5:	c3                   	ret    
801065e6:	8d 76 00             	lea    0x0(%esi),%esi
801065e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801065f0:	85 c9                	test   %ecx,%ecx
801065f2:	74 2c                	je     80106620 <walkpgdir+0x70>
801065f4:	e8 87 be ff ff       	call   80102480 <kalloc>
801065f9:	85 c0                	test   %eax,%eax
801065fb:	89 c6                	mov    %eax,%esi
801065fd:	74 21                	je     80106620 <walkpgdir+0x70>
801065ff:	83 ec 04             	sub    $0x4,%esp
80106602:	68 00 10 00 00       	push   $0x1000
80106607:	6a 00                	push   $0x0
80106609:	50                   	push   %eax
8010660a:	e8 61 de ff ff       	call   80104470 <memset>
8010660f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106615:	83 c4 10             	add    $0x10,%esp
80106618:	83 c8 07             	or     $0x7,%eax
8010661b:	89 07                	mov    %eax,(%edi)
8010661d:	eb b3                	jmp    801065d2 <walkpgdir+0x22>
8010661f:	90                   	nop
80106620:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106623:	31 c0                	xor    %eax,%eax
80106625:	5b                   	pop    %ebx
80106626:	5e                   	pop    %esi
80106627:	5f                   	pop    %edi
80106628:	5d                   	pop    %ebp
80106629:	c3                   	ret    
8010662a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106630 <mappages>:
80106630:	55                   	push   %ebp
80106631:	89 e5                	mov    %esp,%ebp
80106633:	57                   	push   %edi
80106634:	56                   	push   %esi
80106635:	53                   	push   %ebx
80106636:	89 d3                	mov    %edx,%ebx
80106638:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
8010663e:	83 ec 1c             	sub    $0x1c,%esp
80106641:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106644:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106648:	8b 7d 08             	mov    0x8(%ebp),%edi
8010664b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106650:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106653:	8b 45 0c             	mov    0xc(%ebp),%eax
80106656:	29 df                	sub    %ebx,%edi
80106658:	83 c8 01             	or     $0x1,%eax
8010665b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010665e:	eb 15                	jmp    80106675 <mappages+0x45>
80106660:	f6 00 01             	testb  $0x1,(%eax)
80106663:	75 45                	jne    801066aa <mappages+0x7a>
80106665:	0b 75 dc             	or     -0x24(%ebp),%esi
80106668:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010666b:	89 30                	mov    %esi,(%eax)
8010666d:	74 31                	je     801066a0 <mappages+0x70>
8010666f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106675:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106678:	b9 01 00 00 00       	mov    $0x1,%ecx
8010667d:	89 da                	mov    %ebx,%edx
8010667f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106682:	e8 29 ff ff ff       	call   801065b0 <walkpgdir>
80106687:	85 c0                	test   %eax,%eax
80106689:	75 d5                	jne    80106660 <mappages+0x30>
8010668b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010668e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106693:	5b                   	pop    %ebx
80106694:	5e                   	pop    %esi
80106695:	5f                   	pop    %edi
80106696:	5d                   	pop    %ebp
80106697:	c3                   	ret    
80106698:	90                   	nop
80106699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801066a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801066a3:	31 c0                	xor    %eax,%eax
801066a5:	5b                   	pop    %ebx
801066a6:	5e                   	pop    %esi
801066a7:	5f                   	pop    %edi
801066a8:	5d                   	pop    %ebp
801066a9:	c3                   	ret    
801066aa:	83 ec 0c             	sub    $0xc,%esp
801066ad:	68 2c 78 10 80       	push   $0x8010782c
801066b2:	e8 b9 9c ff ff       	call   80100370 <panic>
801066b7:	89 f6                	mov    %esi,%esi
801066b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801066c0 <deallocuvm.part.0>:
801066c0:	55                   	push   %ebp
801066c1:	89 e5                	mov    %esp,%ebp
801066c3:	57                   	push   %edi
801066c4:	56                   	push   %esi
801066c5:	53                   	push   %ebx
801066c6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
801066cc:	89 c7                	mov    %eax,%edi
801066ce:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801066d4:	83 ec 1c             	sub    $0x1c,%esp
801066d7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801066da:	39 d3                	cmp    %edx,%ebx
801066dc:	73 66                	jae    80106744 <deallocuvm.part.0+0x84>
801066de:	89 d6                	mov    %edx,%esi
801066e0:	eb 3d                	jmp    8010671f <deallocuvm.part.0+0x5f>
801066e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801066e8:	8b 10                	mov    (%eax),%edx
801066ea:	f6 c2 01             	test   $0x1,%dl
801066ed:	74 26                	je     80106715 <deallocuvm.part.0+0x55>
801066ef:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
801066f5:	74 58                	je     8010674f <deallocuvm.part.0+0x8f>
801066f7:	83 ec 0c             	sub    $0xc,%esp
801066fa:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106700:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106703:	52                   	push   %edx
80106704:	e8 c7 bb ff ff       	call   801022d0 <kfree>
80106709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010670c:	83 c4 10             	add    $0x10,%esp
8010670f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106715:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010671b:	39 f3                	cmp    %esi,%ebx
8010671d:	73 25                	jae    80106744 <deallocuvm.part.0+0x84>
8010671f:	31 c9                	xor    %ecx,%ecx
80106721:	89 da                	mov    %ebx,%edx
80106723:	89 f8                	mov    %edi,%eax
80106725:	e8 86 fe ff ff       	call   801065b0 <walkpgdir>
8010672a:	85 c0                	test   %eax,%eax
8010672c:	75 ba                	jne    801066e8 <deallocuvm.part.0+0x28>
8010672e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106734:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010673a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106740:	39 f3                	cmp    %esi,%ebx
80106742:	72 db                	jb     8010671f <deallocuvm.part.0+0x5f>
80106744:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106747:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010674a:	5b                   	pop    %ebx
8010674b:	5e                   	pop    %esi
8010674c:	5f                   	pop    %edi
8010674d:	5d                   	pop    %ebp
8010674e:	c3                   	ret    
8010674f:	83 ec 0c             	sub    $0xc,%esp
80106752:	68 a6 71 10 80       	push   $0x801071a6
80106757:	e8 14 9c ff ff       	call   80100370 <panic>
8010675c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106760 <seginit>:
80106760:	55                   	push   %ebp
80106761:	89 e5                	mov    %esp,%ebp
80106763:	83 ec 18             	sub    $0x18,%esp
80106766:	e8 e5 cf ff ff       	call   80103750 <cpuid>
8010676b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106771:	31 c9                	xor    %ecx,%ecx
80106773:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106778:	66 89 90 f8 27 11 80 	mov    %dx,-0x7feed808(%eax)
8010677f:	66 89 88 fa 27 11 80 	mov    %cx,-0x7feed806(%eax)
80106786:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010678b:	31 c9                	xor    %ecx,%ecx
8010678d:	66 89 90 00 28 11 80 	mov    %dx,-0x7feed800(%eax)
80106794:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80106799:	66 89 88 02 28 11 80 	mov    %cx,-0x7feed7fe(%eax)
801067a0:	31 c9                	xor    %ecx,%ecx
801067a2:	66 89 90 08 28 11 80 	mov    %dx,-0x7feed7f8(%eax)
801067a9:	66 89 88 0a 28 11 80 	mov    %cx,-0x7feed7f6(%eax)
801067b0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067b5:	31 c9                	xor    %ecx,%ecx
801067b7:	66 89 90 10 28 11 80 	mov    %dx,-0x7feed7f0(%eax)
801067be:	c6 80 fc 27 11 80 00 	movb   $0x0,-0x7feed804(%eax)
801067c5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801067ca:	c6 80 fd 27 11 80 9a 	movb   $0x9a,-0x7feed803(%eax)
801067d1:	c6 80 fe 27 11 80 cf 	movb   $0xcf,-0x7feed802(%eax)
801067d8:	c6 80 ff 27 11 80 00 	movb   $0x0,-0x7feed801(%eax)
801067df:	c6 80 04 28 11 80 00 	movb   $0x0,-0x7feed7fc(%eax)
801067e6:	c6 80 05 28 11 80 92 	movb   $0x92,-0x7feed7fb(%eax)
801067ed:	c6 80 06 28 11 80 cf 	movb   $0xcf,-0x7feed7fa(%eax)
801067f4:	c6 80 07 28 11 80 00 	movb   $0x0,-0x7feed7f9(%eax)
801067fb:	c6 80 0c 28 11 80 00 	movb   $0x0,-0x7feed7f4(%eax)
80106802:	c6 80 0d 28 11 80 fa 	movb   $0xfa,-0x7feed7f3(%eax)
80106809:	c6 80 0e 28 11 80 cf 	movb   $0xcf,-0x7feed7f2(%eax)
80106810:	c6 80 0f 28 11 80 00 	movb   $0x0,-0x7feed7f1(%eax)
80106817:	66 89 88 12 28 11 80 	mov    %cx,-0x7feed7ee(%eax)
8010681e:	c6 80 14 28 11 80 00 	movb   $0x0,-0x7feed7ec(%eax)
80106825:	c6 80 15 28 11 80 f2 	movb   $0xf2,-0x7feed7eb(%eax)
8010682c:	c6 80 16 28 11 80 cf 	movb   $0xcf,-0x7feed7ea(%eax)
80106833:	c6 80 17 28 11 80 00 	movb   $0x0,-0x7feed7e9(%eax)
8010683a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010683f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106843:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106847:	c1 e8 10             	shr    $0x10,%eax
8010684a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010684e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106851:	0f 01 10             	lgdtl  (%eax)
80106854:	c9                   	leave  
80106855:	c3                   	ret    
80106856:	8d 76 00             	lea    0x0(%esi),%esi
80106859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106860 <switchkvm>:
80106860:	a1 a4 55 11 80       	mov    0x801155a4,%eax
80106865:	55                   	push   %ebp
80106866:	89 e5                	mov    %esp,%ebp
80106868:	05 00 00 00 80       	add    $0x80000000,%eax
8010686d:	0f 22 d8             	mov    %eax,%cr3
80106870:	5d                   	pop    %ebp
80106871:	c3                   	ret    
80106872:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106880 <switchuvm>:
80106880:	55                   	push   %ebp
80106881:	89 e5                	mov    %esp,%ebp
80106883:	57                   	push   %edi
80106884:	56                   	push   %esi
80106885:	53                   	push   %ebx
80106886:	83 ec 1c             	sub    $0x1c,%esp
80106889:	8b 75 08             	mov    0x8(%ebp),%esi
8010688c:	85 f6                	test   %esi,%esi
8010688e:	0f 84 cd 00 00 00    	je     80106961 <switchuvm+0xe1>
80106894:	8b 46 08             	mov    0x8(%esi),%eax
80106897:	85 c0                	test   %eax,%eax
80106899:	0f 84 dc 00 00 00    	je     8010697b <switchuvm+0xfb>
8010689f:	8b 7e 04             	mov    0x4(%esi),%edi
801068a2:	85 ff                	test   %edi,%edi
801068a4:	0f 84 c4 00 00 00    	je     8010696e <switchuvm+0xee>
801068aa:	e8 e1 d9 ff ff       	call   80104290 <pushcli>
801068af:	e8 1c ce ff ff       	call   801036d0 <mycpu>
801068b4:	89 c3                	mov    %eax,%ebx
801068b6:	e8 15 ce ff ff       	call   801036d0 <mycpu>
801068bb:	89 c7                	mov    %eax,%edi
801068bd:	e8 0e ce ff ff       	call   801036d0 <mycpu>
801068c2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068c5:	83 c7 08             	add    $0x8,%edi
801068c8:	e8 03 ce ff ff       	call   801036d0 <mycpu>
801068cd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801068d0:	83 c0 08             	add    $0x8,%eax
801068d3:	ba 67 00 00 00       	mov    $0x67,%edx
801068d8:	c1 e8 18             	shr    $0x18,%eax
801068db:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801068e2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801068e9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801068f0:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801068f7:	83 c1 08             	add    $0x8,%ecx
801068fa:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106900:	c1 e9 10             	shr    $0x10,%ecx
80106903:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
80106909:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010690e:	e8 bd cd ff ff       	call   801036d0 <mycpu>
80106913:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
8010691a:	e8 b1 cd ff ff       	call   801036d0 <mycpu>
8010691f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106924:	66 89 48 10          	mov    %cx,0x10(%eax)
80106928:	e8 a3 cd ff ff       	call   801036d0 <mycpu>
8010692d:	8b 56 08             	mov    0x8(%esi),%edx
80106930:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106936:	89 48 0c             	mov    %ecx,0xc(%eax)
80106939:	e8 92 cd ff ff       	call   801036d0 <mycpu>
8010693e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
80106942:	b8 28 00 00 00       	mov    $0x28,%eax
80106947:	0f 00 d8             	ltr    %ax
8010694a:	8b 46 04             	mov    0x4(%esi),%eax
8010694d:	05 00 00 00 80       	add    $0x80000000,%eax
80106952:	0f 22 d8             	mov    %eax,%cr3
80106955:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106958:	5b                   	pop    %ebx
80106959:	5e                   	pop    %esi
8010695a:	5f                   	pop    %edi
8010695b:	5d                   	pop    %ebp
8010695c:	e9 6f d9 ff ff       	jmp    801042d0 <popcli>
80106961:	83 ec 0c             	sub    $0xc,%esp
80106964:	68 32 78 10 80       	push   $0x80107832
80106969:	e8 02 9a ff ff       	call   80100370 <panic>
8010696e:	83 ec 0c             	sub    $0xc,%esp
80106971:	68 5d 78 10 80       	push   $0x8010785d
80106976:	e8 f5 99 ff ff       	call   80100370 <panic>
8010697b:	83 ec 0c             	sub    $0xc,%esp
8010697e:	68 48 78 10 80       	push   $0x80107848
80106983:	e8 e8 99 ff ff       	call   80100370 <panic>
80106988:	90                   	nop
80106989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106990 <inituvm>:
80106990:	55                   	push   %ebp
80106991:	89 e5                	mov    %esp,%ebp
80106993:	57                   	push   %edi
80106994:	56                   	push   %esi
80106995:	53                   	push   %ebx
80106996:	83 ec 1c             	sub    $0x1c,%esp
80106999:	8b 75 10             	mov    0x10(%ebp),%esi
8010699c:	8b 45 08             	mov    0x8(%ebp),%eax
8010699f:	8b 7d 0c             	mov    0xc(%ebp),%edi
801069a2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
801069a8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069ab:	77 49                	ja     801069f6 <inituvm+0x66>
801069ad:	e8 ce ba ff ff       	call   80102480 <kalloc>
801069b2:	83 ec 04             	sub    $0x4,%esp
801069b5:	89 c3                	mov    %eax,%ebx
801069b7:	68 00 10 00 00       	push   $0x1000
801069bc:	6a 00                	push   $0x0
801069be:	50                   	push   %eax
801069bf:	e8 ac da ff ff       	call   80104470 <memset>
801069c4:	58                   	pop    %eax
801069c5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801069cb:	b9 00 10 00 00       	mov    $0x1000,%ecx
801069d0:	5a                   	pop    %edx
801069d1:	6a 06                	push   $0x6
801069d3:	50                   	push   %eax
801069d4:	31 d2                	xor    %edx,%edx
801069d6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801069d9:	e8 52 fc ff ff       	call   80106630 <mappages>
801069de:	89 75 10             	mov    %esi,0x10(%ebp)
801069e1:	89 7d 0c             	mov    %edi,0xc(%ebp)
801069e4:	83 c4 10             	add    $0x10,%esp
801069e7:	89 5d 08             	mov    %ebx,0x8(%ebp)
801069ea:	8d 65 f4             	lea    -0xc(%ebp),%esp
801069ed:	5b                   	pop    %ebx
801069ee:	5e                   	pop    %esi
801069ef:	5f                   	pop    %edi
801069f0:	5d                   	pop    %ebp
801069f1:	e9 2a db ff ff       	jmp    80104520 <memmove>
801069f6:	83 ec 0c             	sub    $0xc,%esp
801069f9:	68 71 78 10 80       	push   $0x80107871
801069fe:	e8 6d 99 ff ff       	call   80100370 <panic>
80106a03:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a10 <loaduvm>:
80106a10:	55                   	push   %ebp
80106a11:	89 e5                	mov    %esp,%ebp
80106a13:	57                   	push   %edi
80106a14:	56                   	push   %esi
80106a15:	53                   	push   %ebx
80106a16:	83 ec 0c             	sub    $0xc,%esp
80106a19:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106a20:	0f 85 91 00 00 00    	jne    80106ab7 <loaduvm+0xa7>
80106a26:	8b 75 18             	mov    0x18(%ebp),%esi
80106a29:	31 db                	xor    %ebx,%ebx
80106a2b:	85 f6                	test   %esi,%esi
80106a2d:	75 1a                	jne    80106a49 <loaduvm+0x39>
80106a2f:	eb 6f                	jmp    80106aa0 <loaduvm+0x90>
80106a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a38:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a3e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106a44:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106a47:	76 57                	jbe    80106aa0 <loaduvm+0x90>
80106a49:	8b 55 0c             	mov    0xc(%ebp),%edx
80106a4c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a4f:	31 c9                	xor    %ecx,%ecx
80106a51:	01 da                	add    %ebx,%edx
80106a53:	e8 58 fb ff ff       	call   801065b0 <walkpgdir>
80106a58:	85 c0                	test   %eax,%eax
80106a5a:	74 4e                	je     80106aaa <loaduvm+0x9a>
80106a5c:	8b 00                	mov    (%eax),%eax
80106a5e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106a61:	bf 00 10 00 00       	mov    $0x1000,%edi
80106a66:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106a6b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106a71:	0f 46 fe             	cmovbe %esi,%edi
80106a74:	01 d9                	add    %ebx,%ecx
80106a76:	05 00 00 00 80       	add    $0x80000000,%eax
80106a7b:	57                   	push   %edi
80106a7c:	51                   	push   %ecx
80106a7d:	50                   	push   %eax
80106a7e:	ff 75 10             	pushl  0x10(%ebp)
80106a81:	e8 ba ae ff ff       	call   80101940 <readi>
80106a86:	83 c4 10             	add    $0x10,%esp
80106a89:	39 c7                	cmp    %eax,%edi
80106a8b:	74 ab                	je     80106a38 <loaduvm+0x28>
80106a8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106a95:	5b                   	pop    %ebx
80106a96:	5e                   	pop    %esi
80106a97:	5f                   	pop    %edi
80106a98:	5d                   	pop    %ebp
80106a99:	c3                   	ret    
80106a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106aa0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106aa3:	31 c0                	xor    %eax,%eax
80106aa5:	5b                   	pop    %ebx
80106aa6:	5e                   	pop    %esi
80106aa7:	5f                   	pop    %edi
80106aa8:	5d                   	pop    %ebp
80106aa9:	c3                   	ret    
80106aaa:	83 ec 0c             	sub    $0xc,%esp
80106aad:	68 8b 78 10 80       	push   $0x8010788b
80106ab2:	e8 b9 98 ff ff       	call   80100370 <panic>
80106ab7:	83 ec 0c             	sub    $0xc,%esp
80106aba:	68 2c 79 10 80       	push   $0x8010792c
80106abf:	e8 ac 98 ff ff       	call   80100370 <panic>
80106ac4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106aca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106ad0 <allocuvm>:
80106ad0:	55                   	push   %ebp
80106ad1:	89 e5                	mov    %esp,%ebp
80106ad3:	57                   	push   %edi
80106ad4:	56                   	push   %esi
80106ad5:	53                   	push   %ebx
80106ad6:	83 ec 0c             	sub    $0xc,%esp
80106ad9:	8b 7d 10             	mov    0x10(%ebp),%edi
80106adc:	85 ff                	test   %edi,%edi
80106ade:	0f 88 ca 00 00 00    	js     80106bae <allocuvm+0xde>
80106ae4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106ae7:	8b 45 0c             	mov    0xc(%ebp),%eax
80106aea:	0f 82 82 00 00 00    	jb     80106b72 <allocuvm+0xa2>
80106af0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106af6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106afc:	39 df                	cmp    %ebx,%edi
80106afe:	77 43                	ja     80106b43 <allocuvm+0x73>
80106b00:	e9 bb 00 00 00       	jmp    80106bc0 <allocuvm+0xf0>
80106b05:	8d 76 00             	lea    0x0(%esi),%esi
80106b08:	83 ec 04             	sub    $0x4,%esp
80106b0b:	68 00 10 00 00       	push   $0x1000
80106b10:	6a 00                	push   $0x0
80106b12:	50                   	push   %eax
80106b13:	e8 58 d9 ff ff       	call   80104470 <memset>
80106b18:	58                   	pop    %eax
80106b19:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b1f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b24:	5a                   	pop    %edx
80106b25:	6a 06                	push   $0x6
80106b27:	50                   	push   %eax
80106b28:	89 da                	mov    %ebx,%edx
80106b2a:	8b 45 08             	mov    0x8(%ebp),%eax
80106b2d:	e8 fe fa ff ff       	call   80106630 <mappages>
80106b32:	83 c4 10             	add    $0x10,%esp
80106b35:	85 c0                	test   %eax,%eax
80106b37:	78 47                	js     80106b80 <allocuvm+0xb0>
80106b39:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b3f:	39 df                	cmp    %ebx,%edi
80106b41:	76 7d                	jbe    80106bc0 <allocuvm+0xf0>
80106b43:	e8 38 b9 ff ff       	call   80102480 <kalloc>
80106b48:	85 c0                	test   %eax,%eax
80106b4a:	89 c6                	mov    %eax,%esi
80106b4c:	75 ba                	jne    80106b08 <allocuvm+0x38>
80106b4e:	83 ec 0c             	sub    $0xc,%esp
80106b51:	68 a9 78 10 80       	push   $0x801078a9
80106b56:	e8 05 9b ff ff       	call   80100660 <cprintf>
80106b5b:	83 c4 10             	add    $0x10,%esp
80106b5e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b61:	76 4b                	jbe    80106bae <allocuvm+0xde>
80106b63:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b66:	8b 45 08             	mov    0x8(%ebp),%eax
80106b69:	89 fa                	mov    %edi,%edx
80106b6b:	e8 50 fb ff ff       	call   801066c0 <deallocuvm.part.0>
80106b70:	31 c0                	xor    %eax,%eax
80106b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b75:	5b                   	pop    %ebx
80106b76:	5e                   	pop    %esi
80106b77:	5f                   	pop    %edi
80106b78:	5d                   	pop    %ebp
80106b79:	c3                   	ret    
80106b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b80:	83 ec 0c             	sub    $0xc,%esp
80106b83:	68 c1 78 10 80       	push   $0x801078c1
80106b88:	e8 d3 9a ff ff       	call   80100660 <cprintf>
80106b8d:	83 c4 10             	add    $0x10,%esp
80106b90:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b93:	76 0d                	jbe    80106ba2 <allocuvm+0xd2>
80106b95:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b98:	8b 45 08             	mov    0x8(%ebp),%eax
80106b9b:	89 fa                	mov    %edi,%edx
80106b9d:	e8 1e fb ff ff       	call   801066c0 <deallocuvm.part.0>
80106ba2:	83 ec 0c             	sub    $0xc,%esp
80106ba5:	56                   	push   %esi
80106ba6:	e8 25 b7 ff ff       	call   801022d0 <kfree>
80106bab:	83 c4 10             	add    $0x10,%esp
80106bae:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bb1:	31 c0                	xor    %eax,%eax
80106bb3:	5b                   	pop    %ebx
80106bb4:	5e                   	pop    %esi
80106bb5:	5f                   	pop    %edi
80106bb6:	5d                   	pop    %ebp
80106bb7:	c3                   	ret    
80106bb8:	90                   	nop
80106bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bc3:	89 f8                	mov    %edi,%eax
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5f                   	pop    %edi
80106bc8:	5d                   	pop    %ebp
80106bc9:	c3                   	ret    
80106bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106bd0 <deallocuvm>:
80106bd0:	55                   	push   %ebp
80106bd1:	89 e5                	mov    %esp,%ebp
80106bd3:	8b 55 0c             	mov    0xc(%ebp),%edx
80106bd6:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106bd9:	8b 45 08             	mov    0x8(%ebp),%eax
80106bdc:	39 d1                	cmp    %edx,%ecx
80106bde:	73 10                	jae    80106bf0 <deallocuvm+0x20>
80106be0:	5d                   	pop    %ebp
80106be1:	e9 da fa ff ff       	jmp    801066c0 <deallocuvm.part.0>
80106be6:	8d 76 00             	lea    0x0(%esi),%esi
80106be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106bf0:	89 d0                	mov    %edx,%eax
80106bf2:	5d                   	pop    %ebp
80106bf3:	c3                   	ret    
80106bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c00 <freevm>:
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	57                   	push   %edi
80106c04:	56                   	push   %esi
80106c05:	53                   	push   %ebx
80106c06:	83 ec 0c             	sub    $0xc,%esp
80106c09:	8b 75 08             	mov    0x8(%ebp),%esi
80106c0c:	85 f6                	test   %esi,%esi
80106c0e:	74 59                	je     80106c69 <freevm+0x69>
80106c10:	31 c9                	xor    %ecx,%ecx
80106c12:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c17:	89 f0                	mov    %esi,%eax
80106c19:	e8 a2 fa ff ff       	call   801066c0 <deallocuvm.part.0>
80106c1e:	89 f3                	mov    %esi,%ebx
80106c20:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106c26:	eb 0f                	jmp    80106c37 <freevm+0x37>
80106c28:	90                   	nop
80106c29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c30:	83 c3 04             	add    $0x4,%ebx
80106c33:	39 fb                	cmp    %edi,%ebx
80106c35:	74 23                	je     80106c5a <freevm+0x5a>
80106c37:	8b 03                	mov    (%ebx),%eax
80106c39:	a8 01                	test   $0x1,%al
80106c3b:	74 f3                	je     80106c30 <freevm+0x30>
80106c3d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c42:	83 ec 0c             	sub    $0xc,%esp
80106c45:	83 c3 04             	add    $0x4,%ebx
80106c48:	05 00 00 00 80       	add    $0x80000000,%eax
80106c4d:	50                   	push   %eax
80106c4e:	e8 7d b6 ff ff       	call   801022d0 <kfree>
80106c53:	83 c4 10             	add    $0x10,%esp
80106c56:	39 fb                	cmp    %edi,%ebx
80106c58:	75 dd                	jne    80106c37 <freevm+0x37>
80106c5a:	89 75 08             	mov    %esi,0x8(%ebp)
80106c5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c60:	5b                   	pop    %ebx
80106c61:	5e                   	pop    %esi
80106c62:	5f                   	pop    %edi
80106c63:	5d                   	pop    %ebp
80106c64:	e9 67 b6 ff ff       	jmp    801022d0 <kfree>
80106c69:	83 ec 0c             	sub    $0xc,%esp
80106c6c:	68 dd 78 10 80       	push   $0x801078dd
80106c71:	e8 fa 96 ff ff       	call   80100370 <panic>
80106c76:	8d 76 00             	lea    0x0(%esi),%esi
80106c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c80 <setupkvm>:
80106c80:	55                   	push   %ebp
80106c81:	89 e5                	mov    %esp,%ebp
80106c83:	56                   	push   %esi
80106c84:	53                   	push   %ebx
80106c85:	e8 f6 b7 ff ff       	call   80102480 <kalloc>
80106c8a:	85 c0                	test   %eax,%eax
80106c8c:	74 6a                	je     80106cf8 <setupkvm+0x78>
80106c8e:	83 ec 04             	sub    $0x4,%esp
80106c91:	89 c6                	mov    %eax,%esi
80106c93:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106c98:	68 00 10 00 00       	push   $0x1000
80106c9d:	6a 00                	push   $0x0
80106c9f:	50                   	push   %eax
80106ca0:	e8 cb d7 ff ff       	call   80104470 <memset>
80106ca5:	83 c4 10             	add    $0x10,%esp
80106ca8:	8b 43 04             	mov    0x4(%ebx),%eax
80106cab:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106cae:	83 ec 08             	sub    $0x8,%esp
80106cb1:	8b 13                	mov    (%ebx),%edx
80106cb3:	ff 73 0c             	pushl  0xc(%ebx)
80106cb6:	50                   	push   %eax
80106cb7:	29 c1                	sub    %eax,%ecx
80106cb9:	89 f0                	mov    %esi,%eax
80106cbb:	e8 70 f9 ff ff       	call   80106630 <mappages>
80106cc0:	83 c4 10             	add    $0x10,%esp
80106cc3:	85 c0                	test   %eax,%eax
80106cc5:	78 19                	js     80106ce0 <setupkvm+0x60>
80106cc7:	83 c3 10             	add    $0x10,%ebx
80106cca:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106cd0:	75 d6                	jne    80106ca8 <setupkvm+0x28>
80106cd2:	89 f0                	mov    %esi,%eax
80106cd4:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106cd7:	5b                   	pop    %ebx
80106cd8:	5e                   	pop    %esi
80106cd9:	5d                   	pop    %ebp
80106cda:	c3                   	ret    
80106cdb:	90                   	nop
80106cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106ce0:	83 ec 0c             	sub    $0xc,%esp
80106ce3:	56                   	push   %esi
80106ce4:	e8 17 ff ff ff       	call   80106c00 <freevm>
80106ce9:	83 c4 10             	add    $0x10,%esp
80106cec:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106cef:	31 c0                	xor    %eax,%eax
80106cf1:	5b                   	pop    %ebx
80106cf2:	5e                   	pop    %esi
80106cf3:	5d                   	pop    %ebp
80106cf4:	c3                   	ret    
80106cf5:	8d 76 00             	lea    0x0(%esi),%esi
80106cf8:	31 c0                	xor    %eax,%eax
80106cfa:	eb d8                	jmp    80106cd4 <setupkvm+0x54>
80106cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d00 <kvmalloc>:
80106d00:	55                   	push   %ebp
80106d01:	89 e5                	mov    %esp,%ebp
80106d03:	83 ec 08             	sub    $0x8,%esp
80106d06:	e8 75 ff ff ff       	call   80106c80 <setupkvm>
80106d0b:	a3 a4 55 11 80       	mov    %eax,0x801155a4
80106d10:	05 00 00 00 80       	add    $0x80000000,%eax
80106d15:	0f 22 d8             	mov    %eax,%cr3
80106d18:	c9                   	leave  
80106d19:	c3                   	ret    
80106d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d20 <clearpteu>:
80106d20:	55                   	push   %ebp
80106d21:	31 c9                	xor    %ecx,%ecx
80106d23:	89 e5                	mov    %esp,%ebp
80106d25:	83 ec 08             	sub    $0x8,%esp
80106d28:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d2b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d2e:	e8 7d f8 ff ff       	call   801065b0 <walkpgdir>
80106d33:	85 c0                	test   %eax,%eax
80106d35:	74 05                	je     80106d3c <clearpteu+0x1c>
80106d37:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106d3a:	c9                   	leave  
80106d3b:	c3                   	ret    
80106d3c:	83 ec 0c             	sub    $0xc,%esp
80106d3f:	68 ee 78 10 80       	push   $0x801078ee
80106d44:	e8 27 96 ff ff       	call   80100370 <panic>
80106d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d50 <copyuvm>:
80106d50:	55                   	push   %ebp
80106d51:	89 e5                	mov    %esp,%ebp
80106d53:	57                   	push   %edi
80106d54:	56                   	push   %esi
80106d55:	53                   	push   %ebx
80106d56:	83 ec 1c             	sub    $0x1c,%esp
80106d59:	e8 22 ff ff ff       	call   80106c80 <setupkvm>
80106d5e:	85 c0                	test   %eax,%eax
80106d60:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106d63:	0f 84 c5 00 00 00    	je     80106e2e <copyuvm+0xde>
80106d69:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d6c:	85 c9                	test   %ecx,%ecx
80106d6e:	0f 84 9c 00 00 00    	je     80106e10 <copyuvm+0xc0>
80106d74:	31 ff                	xor    %edi,%edi
80106d76:	eb 4a                	jmp    80106dc2 <copyuvm+0x72>
80106d78:	90                   	nop
80106d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d80:	83 ec 04             	sub    $0x4,%esp
80106d83:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80106d89:	68 00 10 00 00       	push   $0x1000
80106d8e:	53                   	push   %ebx
80106d8f:	50                   	push   %eax
80106d90:	e8 8b d7 ff ff       	call   80104520 <memmove>
80106d95:	58                   	pop    %eax
80106d96:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106d9c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106da1:	5a                   	pop    %edx
80106da2:	ff 75 e4             	pushl  -0x1c(%ebp)
80106da5:	50                   	push   %eax
80106da6:	89 fa                	mov    %edi,%edx
80106da8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106dab:	e8 80 f8 ff ff       	call   80106630 <mappages>
80106db0:	83 c4 10             	add    $0x10,%esp
80106db3:	85 c0                	test   %eax,%eax
80106db5:	78 69                	js     80106e20 <copyuvm+0xd0>
80106db7:	81 c7 00 10 00 00    	add    $0x1000,%edi
80106dbd:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80106dc0:	76 4e                	jbe    80106e10 <copyuvm+0xc0>
80106dc2:	8b 45 08             	mov    0x8(%ebp),%eax
80106dc5:	31 c9                	xor    %ecx,%ecx
80106dc7:	89 fa                	mov    %edi,%edx
80106dc9:	e8 e2 f7 ff ff       	call   801065b0 <walkpgdir>
80106dce:	85 c0                	test   %eax,%eax
80106dd0:	74 6d                	je     80106e3f <copyuvm+0xef>
80106dd2:	8b 00                	mov    (%eax),%eax
80106dd4:	a8 01                	test   $0x1,%al
80106dd6:	74 5a                	je     80106e32 <copyuvm+0xe2>
80106dd8:	89 c3                	mov    %eax,%ebx
80106dda:	25 ff 0f 00 00       	and    $0xfff,%eax
80106ddf:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106de5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106de8:	e8 93 b6 ff ff       	call   80102480 <kalloc>
80106ded:	85 c0                	test   %eax,%eax
80106def:	89 c6                	mov    %eax,%esi
80106df1:	75 8d                	jne    80106d80 <copyuvm+0x30>
80106df3:	83 ec 0c             	sub    $0xc,%esp
80106df6:	ff 75 e0             	pushl  -0x20(%ebp)
80106df9:	e8 02 fe ff ff       	call   80106c00 <freevm>
80106dfe:	83 c4 10             	add    $0x10,%esp
80106e01:	31 c0                	xor    %eax,%eax
80106e03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e06:	5b                   	pop    %ebx
80106e07:	5e                   	pop    %esi
80106e08:	5f                   	pop    %edi
80106e09:	5d                   	pop    %ebp
80106e0a:	c3                   	ret    
80106e0b:	90                   	nop
80106e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e10:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106e13:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e16:	5b                   	pop    %ebx
80106e17:	5e                   	pop    %esi
80106e18:	5f                   	pop    %edi
80106e19:	5d                   	pop    %ebp
80106e1a:	c3                   	ret    
80106e1b:	90                   	nop
80106e1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e20:	83 ec 0c             	sub    $0xc,%esp
80106e23:	56                   	push   %esi
80106e24:	e8 a7 b4 ff ff       	call   801022d0 <kfree>
80106e29:	83 c4 10             	add    $0x10,%esp
80106e2c:	eb c5                	jmp    80106df3 <copyuvm+0xa3>
80106e2e:	31 c0                	xor    %eax,%eax
80106e30:	eb d1                	jmp    80106e03 <copyuvm+0xb3>
80106e32:	83 ec 0c             	sub    $0xc,%esp
80106e35:	68 12 79 10 80       	push   $0x80107912
80106e3a:	e8 31 95 ff ff       	call   80100370 <panic>
80106e3f:	83 ec 0c             	sub    $0xc,%esp
80106e42:	68 f8 78 10 80       	push   $0x801078f8
80106e47:	e8 24 95 ff ff       	call   80100370 <panic>
80106e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106e50 <uva2ka>:
80106e50:	55                   	push   %ebp
80106e51:	31 c9                	xor    %ecx,%ecx
80106e53:	89 e5                	mov    %esp,%ebp
80106e55:	83 ec 08             	sub    $0x8,%esp
80106e58:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e5b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e5e:	e8 4d f7 ff ff       	call   801065b0 <walkpgdir>
80106e63:	8b 00                	mov    (%eax),%eax
80106e65:	89 c2                	mov    %eax,%edx
80106e67:	83 e2 05             	and    $0x5,%edx
80106e6a:	83 fa 05             	cmp    $0x5,%edx
80106e6d:	75 11                	jne    80106e80 <uva2ka+0x30>
80106e6f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e74:	c9                   	leave  
80106e75:	05 00 00 00 80       	add    $0x80000000,%eax
80106e7a:	c3                   	ret    
80106e7b:	90                   	nop
80106e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e80:	31 c0                	xor    %eax,%eax
80106e82:	c9                   	leave  
80106e83:	c3                   	ret    
80106e84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106e90 <copyout>:
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	57                   	push   %edi
80106e94:	56                   	push   %esi
80106e95:	53                   	push   %ebx
80106e96:	83 ec 1c             	sub    $0x1c,%esp
80106e99:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106e9c:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e9f:	8b 7d 10             	mov    0x10(%ebp),%edi
80106ea2:	85 db                	test   %ebx,%ebx
80106ea4:	75 40                	jne    80106ee6 <copyout+0x56>
80106ea6:	eb 70                	jmp    80106f18 <copyout+0x88>
80106ea8:	90                   	nop
80106ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106eb0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106eb3:	89 f1                	mov    %esi,%ecx
80106eb5:	29 d1                	sub    %edx,%ecx
80106eb7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106ebd:	39 d9                	cmp    %ebx,%ecx
80106ebf:	0f 47 cb             	cmova  %ebx,%ecx
80106ec2:	29 f2                	sub    %esi,%edx
80106ec4:	83 ec 04             	sub    $0x4,%esp
80106ec7:	01 d0                	add    %edx,%eax
80106ec9:	51                   	push   %ecx
80106eca:	57                   	push   %edi
80106ecb:	50                   	push   %eax
80106ecc:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106ecf:	e8 4c d6 ff ff       	call   80104520 <memmove>
80106ed4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106ed7:	83 c4 10             	add    $0x10,%esp
80106eda:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80106ee0:	01 cf                	add    %ecx,%edi
80106ee2:	29 cb                	sub    %ecx,%ebx
80106ee4:	74 32                	je     80106f18 <copyout+0x88>
80106ee6:	89 d6                	mov    %edx,%esi
80106ee8:	83 ec 08             	sub    $0x8,%esp
80106eeb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106eee:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80106ef4:	56                   	push   %esi
80106ef5:	ff 75 08             	pushl  0x8(%ebp)
80106ef8:	e8 53 ff ff ff       	call   80106e50 <uva2ka>
80106efd:	83 c4 10             	add    $0x10,%esp
80106f00:	85 c0                	test   %eax,%eax
80106f02:	75 ac                	jne    80106eb0 <copyout+0x20>
80106f04:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f0c:	5b                   	pop    %ebx
80106f0d:	5e                   	pop    %esi
80106f0e:	5f                   	pop    %edi
80106f0f:	5d                   	pop    %ebp
80106f10:	c3                   	ret    
80106f11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f1b:	31 c0                	xor    %eax,%eax
80106f1d:	5b                   	pop    %ebx
80106f1e:	5e                   	pop    %esi
80106f1f:	5f                   	pop    %edi
80106f20:	5d                   	pop    %ebp
80106f21:	c3                   	ret    
