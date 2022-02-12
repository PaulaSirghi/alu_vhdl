----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 17:03:30
-- Design Name: 
-- Module Name: counter - Behavioral
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
  Port (D: in std_logic_vector(4 downto 0);
        clk: in std_logic;
        en: in std_logic;
        Q: out std_logic_vector(4 downto 0));
end counter;

architecture Behavioral of counter is
signal Ds: std_logic_vector(4 downto 0):="00000";
begin

Ds<=D;
process(clk,en,d)
begin
if en = '1' then 
  if rising_edge(clk) then
     Q<=Ds;
     Ds<=Ds-1;
  end if;
end if;
end process;
end Behavioral;
