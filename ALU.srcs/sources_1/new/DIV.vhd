----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.11.2021 15:44:47
-- Design Name: 
-- Module Name: inmultitor - Behavioral
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

entity div is
  Port ( RX: in std_logic_vector(31 downto 0);
  sx: in std_logic;
  RY: in std_logic_vector(31 downto 0);
  sy: in std_logic;
  clk: in std_logic;
  start: in std_logic;
  ovf: out std_logic;
  zero: out std_logic;
  rdy: out std_logic;
  rez: out std_logic_vector(63 downto 0);
  sz: out std_logic
   );
end div;

architecture Behavioral of div is

component flags is
 Port ( A: in std_logic_vector(31 downto 0);
        zero: out std_logic; 
        ovf : out std_logic);
end component;

component rezImpartire is
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
end component;



component UC_div is
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
end component;


component SumSub is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        sel: in std_logic;
        op: in std_logic_vector(2 downto 0);
        Cout: out std_logic;
        rdy: out std_logic;
        S: out std_logic_vector(63 downto 0));
end component;
component mux_32 is
  Port (
        A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        s: in std_logic;
        load: in std_logic;
        rez: out std_logic_vector(31 downto 0));
end component;

component comparator is
  Port (A: in std_logic_vector(31 downto 0);
        B: in std_logic_vector(31 downto 0);
        test: in std_logic;
        rdy: out std_logic);
end component;

 signal clks: std_logic:='0';
 signal dif: std_logic_vector(63 downto 0);
 signal carry: std_logic;
 signal load: std_logic:='1';
 signal cat: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
 signal cats: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
 signal cats2: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
 signal srdy: std_logic;
 signal rests: std_logic_vector(31 downto 0);
 signal en: std_logic:='0';
 signal test: std_logic;
 signal sub: std_logic;
 signal zzero: std_logic;
 signal sel: std_logic;
 signal rdys: std_logic;
 signal rdysuc: std_logic;
 signal en_end: std_logic:='0';
 signal X: std_logic_vector(31 downto 0):="00000000000000000000000000000110";
 signal op: std_logic_vector(2 downto 0);

begin
clks<=not clks after 1 ns;


c4: mux_32 port map(RX,restS,rdys,load,X);  --selectam A la inceput, iar in rest diferenta pentru intrare in rezInmultire
c5: comparator port map(X,RY,test,en_end);
c1: UC_div port map(clks,start,en_end,load,sub,test,zzero,sel,srdy,op);
c2: rezImpartire port map(clks,cats2,X,RY,dif(31 downto 0),sub,carry,load,cat,rests);
c3: SumSub port map(X,RY,sel,op,carry,rdys,dif);
c7: mux_32 port map("00000000000000000000000000000000",cat,'1',load,cats2);

process(srdy)
begin
    if srdy = '1' then 
       rez(31 downto 0)<=restS;
       rez(63 downto 32)<=cat;
       rdy<='1';
       zero<=zzero;
       sz<=sx or sy;
     end if;
end process;

end Behavioral;