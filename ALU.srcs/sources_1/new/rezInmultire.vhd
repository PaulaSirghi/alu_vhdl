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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rezInmultire is
  Port (clk:in std_logic;
      B: in std_logic_vector(31 downto 0);
      suma:in std_logic_vector(31 downto 0);
      cOut: in std_logic;
      add: in std_logic;
      ld: in std_logic;
      shift: in std_logic;
      lsb: out std_logic;
      rb: out std_logic_vector(31 downto 0);
      rez_o: out std_logic_vector(63 downto 0));
end rezInmultire;

architecture Behavioral of rezInmultire is

signal temp_register : std_logic_vector(64 downto 0);
signal temp_Add : std_logic;


begin
process(clk)
begin
if rising_edge(clk) then
   if ld ='1' then 
       temp_register (64 downto 32) <= (others => '0');
       temp_register(31 downto 0) <= B;   --incarcam B in registrul ACC
   end if;
   if add='1' then
       temp_Add<='1';
   end if;
        
   if shift='1' then --shiftam
         if temp_add='1' then
         --stocam rezultatul sumei si shiftam la dreapta
           temp_add<='0';
           temp_register<='0' & cout & suma & temp_register(31 downto 1);
          
         else
            --doar shiftam 
            temp_register<='0' & temp_register(64 downto 1);
         end if;
    end if;    
   end if;
end process;

rez_o<=temp_register(63 downto 0);
lsb<=temp_register(0);
rb<=temp_register(63 downto 32);
end Behavioral;
