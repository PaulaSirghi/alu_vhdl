----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.11.2021 14:48:49
-- Design Name: 
-- Module Name: rezInmultire - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rezImpartire is
  Port (clk:in std_logic;
      cont: in std_logic_vector(31 downto 0);
      A: in std_logic_vector(31 downto 0);
      B: in std_logic_vector(31 downto 0);
      dif:in std_logic_vector(31 downto 0);
      sub: in std_logic;
      cOut: in std_logic;
      ld: in std_logic;
      rb: out std_logic_vector(31 downto 0);
      rez_o: out std_logic_vector(31 downto 0));
end rezImpartire;


architecture Behavioral of rezImpartire is

signal temp_register : std_logic_vector(63 downto 0);


begin
process(clk,sub)
begin
if rising_edge(clk) then
   if ld ='1' then 
       --prima jumatate va fi catul si ultima restul
       temp_register(31 downto 0) <= A;   --restul
   end if;
   if sub='1' then
       temp_register(31 downto 0)<=dif; --diferenta
       rb<=cont+1;
   else rb<=cont; --nu mai crestem numarul de operatii efectuate
   end if;
   
end if;
end process;

rez_o<=temp_register(31 downto 0);

end Behavioral;
