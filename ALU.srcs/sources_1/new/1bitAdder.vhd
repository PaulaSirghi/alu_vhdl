----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2021 10:08:56
-- Design Name: 
-- Module Name: 1bitAdder - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity oneBitAdder is
 Port (a,b,ci,sel: in std_logic;
       op: in std_logic_vector(2 downto 0) ;
       s,co: out std_logic
       );
end oneBitAdder;

architecture Behavioral of oneBitAdder is

begin
process(sel,A,B,ci,op)
begin
    if op="000" then
        if sel='0' then
            S<=A xor B xor ci;
            Co<= (A and B) or ((A and ci) xor (B and ci));
        else
           S<=A xor B xor ci;
           Co<=((not A) and (B or Ci)) or (B and Ci);  
        end if;
    end if;
    
end process;
end Behavioral;
