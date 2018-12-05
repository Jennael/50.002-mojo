<?xml version="1.0" encoding="UTF-8"?>
<project name="essentials" board="Mojo V3" language="Lucid">
  <files>
    <src>gamefsm.luc</src>
    <src>display_morse.luc</src>
    <src top="true">mojo_top.luc</src>
    <ucf>ports.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>spi_slave.luc</component>
    <component>uart_rx.luc</component>
    <component>simple_ram.v</component>
    <component>cclk_detector.luc</component>
    <component>reset_conditioner.luc</component>
    <component>avr_interface.luc</component>
    <component>uart_tx.luc</component>
  </files>
</project>
