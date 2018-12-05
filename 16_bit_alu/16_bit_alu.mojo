<?xml version="1.0" encoding="UTF-8"?>
<project name="16_bit_alu" board="Mojo V3" language="Lucid">
  <files>
    <src>alu.luc</src>
    <src>shifter16.luc</src>
    <src>boolean16.luc</src>
    <src>seven_seg.luc</src>
    <src>compare16.luc</src>
    <src>multi_seven_seg.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>states.luc</src>
    <src>adder16.luc</src>
    <ucf lib="true">io_shield.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>decoder.luc</component>
    <component>reset_conditioner.luc</component>
    <component>counter.luc</component>
  </files>
</project>
