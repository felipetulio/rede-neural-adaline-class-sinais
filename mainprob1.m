clear all;
close all;
clc;

fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                         INTELIG�NCIA COMPUTACIONAL                     |\n');
fprintf('|                              REDE ADALINE                              |\n');
fprintf('|                         (Prof. Renato Dourado Maia)                    |\n');
fprintf('|                     Acad�mico: Felipe T�lio de Castro                  |\n');
fprintf('|                                  FACIT                                 |\n');
fprintf('+------------------------------------------------------------------------+\n');

disp(' ');
disp(' ');
disp('PROBLEMA 1 - CLASSIFICA��O');
disp(' ');
disp(' ');
disp('Pressione qualquer tecla para o processamento inicie..');
disp(' ')
pause

disp('Esta � a primeira execu��o da rede. O perceptron ser� treinado...');

[XTreino,YTreino, XValidacao, YValidacao] = OrganizaDados;

for i = 1 : 5
    [W vetordeErrosLineares vetordeErrosClassif Wretorno epoca numPadroes] = treino(0.0025, XTreino, YTreino, 0.000001);

    disp('__________________________________________________________________ ')
    disp(' Resultados do treinamento:')
    disp(' ')
    fprintf('   >>> O valor inicial para o bias foi  : %f\n', Wretorno(1))
    fprintf('   >>> O valor inicial para o peso 1 foi: %f\n', Wretorno(2))
    fprintf('   >>> O valor inicial para o peso 2 foi: %f\n', Wretorno(3))
    fprintf('   >>> O valor inicial para o peso 3 foi: %f\n', Wretorno(4))
    fprintf('   >>> O valor inicial para o peso 4 foi: %f\n', Wretorno(5))

    disp('__________________________________________________________________ ')
    disp(' ');
    disp(' ');
    disp(' ');
    fprintf('   >>> O valor obtido para o bias foi  : %f\n', W(1))
    fprintf('   >>> O valor obtido para o peso 1 foi: %f\n', W(2))
    fprintf('   >>> O valor obtido para o peso 2 foi: %f\n', W(3))
    fprintf('   >>> O valor obtido para o peso 3 foi: %f\n', W(4))
    fprintf('   >>> O valor obtido para o peso 4 foi: %f\n', W(5))

    disp('__________________________________________________________________ ')
    disp(' ');
    disp('');
    fprintf('   >>> A quantidade de �pocas necess�rias foram: %d\n', epoca)
    disp('');
    disp('');

disp('');
disp('---------------------------------------------------------------------------');
disp('');

        %plota o gr�fico de erros lineares
        plotarErros(vetordeErrosLineares);
        
        %chama da fun��o de executa a rede com os dados de teste
        Yteste = yteste(W);
        
        %plota o vetor de erros de classifica��o
        plotarErrosClassif(vetordeErrosClassif);

        cont = 0;
      
        %executa a fun��o de valida��o da rede Adaline
        Y = yadaline(XValidacao, W);
        
        %faz a verifica��o do percentual de acertos da rede ap�s a
        %valida��o
        Resultado = (Y == YValidacao);
        Verifica = find(Resultado==1);
        Quantidade = length (Verifica);
        perc = (Quantidade * 100)/15;
        disp('');
        disp('');
        fprintf('A rede acertou: %6.4f%%\n', perc);
    
end
    