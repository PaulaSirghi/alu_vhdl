----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 13:35:36
-- Design Name: 
-- Module Name: UC_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity UC_div is
  Port (clk: in std_logic;
        enable: in std_logic;
        en_end: in std_logic;
        load: out std_logic;
        sub: out std_logic;
        test: out std_logic;
        zero: out std_logic;  --cand numaratorulajunge la 0 incheiem algoritmul
        sel: out std_logic;
        rdy: out std_logic;
        op: out std_logic_vector(2 downto 0)
        );
end UC_div;

architecture Behavioral of UC_div is

type states is(start,initreg,substracter,verif,endS);
signal s:states:=start;
signal cat:std_logic_vector(31 downto 0):="00000000000000000000000000000000";   --initializam catul cu 0
signal r: std_logic;

begin


--scadem a-b pana cand a < b , restul va fi rezultatul, iar catul va fi numarul de operatii realizate
process(clk,enable,en_end)
begin
if rising_edge(clk) then
   if en_end = '1' then s<=endS; end if;
   case s is 
   when start => if enable='1' then s<=initreg; end if;
   when initreg => s<=verif;
   when verif => if en_end = '1' then s<=endS; else s<=substracter;end if;--while a > b   a=a-b
   when substracter => if en_end = '1' then s<=endS; else s<=verif; end if; 
   when endS => r<='1';
   end case;
end if;
end process;
zero<='1' when s=start else '0';
load<='1' when s=start else '0';
sub<='1'  when s=substracter else '0';
sel<='1' when s=substracter else 'U';
op<="000" when s=substracter else "111";
test<='1' when s=verif else '0';
rdy<='1' when s=endS else '0';
end Behavioral;
