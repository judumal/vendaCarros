//Juliana Prestupa - 1610282
// Matheus Fabricio Machado de Oliveira - 2220756
 
Program vendaCarros;
type
	carro = record
		marca: string;
		modelo: string;
		valorCompra: real;
		valorVenda: real;
		valorFinal: real;
		lucro: real;			
	end;
			
	opcionais = record
  	arCondicionado: char;
  	vidrosEletricos: char;
  	alarme: char;
  	engate: char;
  	valorOpcional: real;
  end;  
		
const
MAX = 2;
AR = 1500.00;
VID = 2500.00;
ALA = 2000.00;
ENG = 1000.00;

var
i,j,menu: integer;
valorTotal,lucroFinal,valorOpcionais: real;
veiculo: array[1..MAX] of carro;
opcional: array[1..MAX] of opcionais;
  	
Begin

while (menu<>3) do
		begin
		writeln('..................................................');
		writeln('DIGITE AS OPÇÕES A SEGUIR: ');
		writeln('');
		writeln('1 - REGISTRAR VENDAS');
		writeln('2 - RELATORIO DE VENDAS');
		writeln('3 - ENCERRAR');
		readln(menu);	
	
	case menu of
  	1: for i:=1 to MAX do
		begin
			write('REGISTRE A MARCA DO VEÍCULO? ');
			readln(veiculo[i].marca);
			write('REGISTRE O MODELO DO VEÍCULO? ');
			readln(veiculo[i].modelo);
			write('INFORME O VALOR DE COMPRA DO VEÍCULO? ');
			readln(veiculo[i].valorCompra);
			write('INFORME O VALOR DE VENDA DO VEÍCULO? ');
			readln(veiculo[i].valorVenda);
			writeln('');
			writeln('....................ADICIONAIS....................');
			writeln('');
			write('AR CONDICIONADO? ...........',AR:0:2,'.......... S/N');
			readln(opcional[i].arCondicionado);
			write('VIDROS ELETRICOS? ..........',VID:0:2,'.......... S/N');
			readln(opcional[i].vidrosEletricos);
			write('ALARME? ....................',ALA:0:2,'.......... S/N');;
			readln(opcional[i].alarme);
			write('ENGATE? ....................',ENG:0:2,'.......... S/N');
			readln(opcional[i].engate);
		  writeln('');
			
				
				if (opcional[i].arCondicionado = 'S') then
			 			opcional[i].valorOpcional := opcional[i].valorOpcional + AR;
				if (opcional[i].vidrosEletricos = 'S') then
						opcional[i].valorOpcional := opcional[i].valorOpcional + VID;
				if (opcional[i].alarme = 'S') then
						opcional[i].valorOpcional := opcional[i].valorOpcional + ALA;
				if (opcional[i].engate = 'S') then
						opcional[i].valorOpcional := opcional[i].valorOpcional + ENG;
				
				veiculo[i].valorFinal:=veiculo[i].valorVenda + opcional[i].valorOpcional;
				veiculo[i].lucro := veiculo[i].valorFinal - veiculo[i].valorCompra;		
				lucroFinal:= lucroFinal + veiculo[i].lucro;			
			  end;

				
		2: begin
		textcolor(white);
			 writeln('..................................................');
			 writeln('REGISTRO DE VEÍCULOS VENDIDOS: ');
			 writeln('');
		   for i:= 1 to MAX do
		   	begin
		   	writeln('VENDA ',i ,' ...........: ',veiculo[i].marca,' - ', veiculo[i].modelo);
				writeln('COMPRADO POR.......: ',veiculo[i].valorCompra:0:2); 	
				writeln('ADICIONAIS.........:');
				
				if opcional[i].valorOpcional> 03
				 then
					begin				
						if (opcional[i].arCondicionado = 'S') then
					 			writeln('AR CONDICIONADO....: ',AR:0:2);			
						if (opcional[i].vidrosEletricos = 'S') then
								writeln('VIDROS ELETRICOS...: ',VID:0:2);
						if (opcional[i].alarme = 'S') then
								writeln('ALARME.............: ',ALA:0:2); 
						if (opcional[i].engate = 'S') then
								writeln('ENGATE.............: ',ENG:0:2);
				   end
				   else
				   writeln('NÃO FORAM INCLUÍDOS ADICIONAIS'); 
      		 writeln('VENDIDO POR........: ',veiculo[i].valorFinal:0:2);
					 writeln('LUCRO OBTIDO.......: ',veiculo[i].lucro:0:2);			
					 writeln('');
			  end;
		textcolor(red);	  
		writeln('VENDAS REALIZADAS..: ',i);
		writeln('O LUCRO FINAL......: ',lucroFinal:0:2, ' REAIS');
		writeln('');		
		textcolor(green);	
		end;
	end;
end;	
End.