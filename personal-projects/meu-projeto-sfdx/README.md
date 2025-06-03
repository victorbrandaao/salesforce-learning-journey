# Seu Projeto Salesforce DX: Próximos Passos 🚀

Parabéns por criar seu projeto Salesforce DX! Este é um grande passo para um desenvolvimento mais moderno e eficiente no Salesforce. E agora, quais os próximos passos? Para te ajudar a decolar, reunimos alguns recursos e documentações que serão seus guias nesta jornada.

## 🤔 Como Você Planeja Gerenciar e Implantar Suas Mudanças?

Antes de mergulhar de cabeça, vale a pena pensar sobre sua estratégia de desenvolvimento e implantação. Você fará deploys de conjuntos de alterações diretamente para suas orgs sandbox e produção, ou está planejando criar módulos ou aplicações independentes e empacotáveis?

- **Escolha seu Modelo de Desenvolvimento:** O Salesforce oferece diferentes abordagens (como o desenvolvimento baseado na org ou o desenvolvimento de pacotes). Entender as características de cada um te ajudará a estruturar seu projeto da melhor forma.
  - ➡️ [Explore os Modelos de Desenvolvimento aqui](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models)

## ⚙️ Configurando o Coração do Seu Projeto Salesforce DX

O arquivo `sfdx-project.json`, localizado na raiz do seu projeto, é fundamental. Ele guarda informações cruciais como a estrutura dos seus diretórios de código (pacotes), a versão da API do Salesforce que você está usando, a URL da sua org padrão e muitas outras configurações.

- **Domine o `sfdx-project.json`:** Dedique um tempo para entender as opções deste arquivo. Isso fará uma grande diferença na gestão do seu projeto.
  - ➡️ [Veja os detalhes em Configuração de Projeto Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) (no _Guia do Desenvolvedor Salesforce DX_)

## 📚 Documentação Essencial para Sua Biblioteca

Estes são os links que você provavelmente visitará com frequência. Guarde-os com carinho!

- **[Documentação das Extensões Salesforce para VS Code](https://developer.salesforce.com/tools/vscode/):**

  - **Para que serve?** É o seu guia completo para usar todas as funcionalidades do Salesforce DX diretamente no Visual Studio Code. Desde criar componentes Aura e Lightning Web Components, até executar testes, fazer deploy e retrieve de metadados.
  - **Quando consultar?** Sempre que tiver dúvidas sobre como realizar uma ação específica do Salesforce dentro do VS Code.

- **[Guia de Configuração da Salesforce CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm):**

  - **Para que serve?** Detalha a instalação e configuração da Interface de Linha de Comando (CLI) do Salesforce (`sf` e o antigo `sfdx`). A CLI é sua principal ferramenta para interagir com suas orgs via terminal, automatizar tarefas e muito mais.
  - **Quando consultar?** Se precisar reinstalar a CLI, configurar novas variáveis de ambiente ou entender melhor os pré-requisitos.

- **[Guia do Desenvolvedor Salesforce DX](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm):**

  - **Para que serve?** Considere este o manual definitivo do Salesforce DX. Ele cobre desde os conceitos fundamentais até os fluxos de trabalho mais avançados, modelos de desenvolvimento, e melhores práticas.
  - **Quando consultar?** Para aprofundar seus conhecimentos sobre qualquer aspecto do SFDX.

- **[Referência de Comandos da Salesforce CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm):**
  - **Para que serve?** Uma lista completa de todos os comandos `sf` (e `sfdx`) com suas respectivas opções, parâmetros e exemplos de uso.
  - **Quando consultar?** Quando você precisar executar um comando específico e quiser saber todas as suas possibilidades ou sintaxe correta.

## ✨ Dicas Extras para Começar Bem:

- **Comece pelo Básico:** Não se sinta pressionado a aprender tudo de uma vez. Experimente um fluxo simples: crie ou modifique um componente (LWC, Apex), faça o deploy para uma org de desenvolvimento e depois recupere (retrieve) alterações feitas na org.
- **Scratch Orgs são suas Amigas:** Se o seu modelo de desenvolvimento permitir (especialmente para desenvolvimento de pacotes ou funcionalidades isoladas), as Scratch Orgs são ambientes descartáveis e configuráveis que agilizam muito o desenvolvimento e os testes.
- **Controle de Versão é Fundamental:** Use Git (ou outro sistema de controle de versão) desde o início do seu projeto. Isso garante a segurança do seu código, facilita o trabalho em equipe e permite rastrear alterações.
- **Aproveite a Comunidade:** Participe de fóruns online, grupos de estudo e da Trailblazer Community. A comunidade Salesforce é incrivelmente ativa e sempre disposta a ajudar.

Boa jornada com o Salesforce DX e que seus deploys sejam sempre bem-sucedidos!
