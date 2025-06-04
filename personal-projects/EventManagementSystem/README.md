# 🎉 Event Management System

<div align="center">

![Salesforce](https://img.shields.io/badge/Salesforce-00D2FF?style=for-the-badge&logo=salesforce&logoColor=white)
![Lightning Web Components](https://img.shields.io/badge/LWC-1589EE?style=for-the-badge&logo=salesforce&logoColor=white)
![Apex](https://img.shields.io/badge/Apex-00D2FF?style=for-the-badge&logo=salesforce&logoColor=white)

*Um sistema completo de gerenciamento de eventos construído na plataforma Salesforce*

</div>

## 📋 Sobre o Projeto

O **Event Management System** é uma aplicação Salesforce desenvolvida para gerenciar eventos de forma eficiente e profissional. Este projeto faz parte da minha jornada de aprendizado em Salesforce e demonstra implementações práticas de Lightning Web Components, Apex e outras tecnologias da plataforma.

### ✨ Principais Funcionalidades

- 📅 **Criação e Gestão de Eventos** - Interface intuitiva para criar e administrar eventos
- 👥 **Gerenciamento de Participantes** - Controle completo de inscrições e participantes
- 📊 **Dashboard e Relatórios** - Visualizações e métricas dos eventos
- 🔔 **Notificações Automáticas** - Sistema de lembretes e comunicações
- 📱 **Interface Responsiva** - Compatível com desktop e mobile

## 🛠️ Tecnologias Utilizadas

- **Salesforce DX** - Ferramenta de desenvolvimento moderna
- **Lightning Web Components (LWC)** - Framework JavaScript reativo
- **Apex** - Linguagem de programação do Salesforce
- **SOQL/SOSL** - Linguagens de consulta do Salesforce
- **Lightning Design System** - Sistema de design do Salesforce

## 🚀 Como Executar o Projeto

### Pré-requisitos

- Salesforce CLI instalado
- VS Code com extensões do Salesforce
- Org de desenvolvimento Salesforce

### Passo a Passo

1. **Clone o repositório**
   ```bash
   git clone https://github.com/victorbrandaao/salesforce-learning-journey.git
   cd salesforce-learning-journey/personal-projects/EventManagementSystem
   ```

2. **Instale as dependências**
   ```bash
   npm install
   ```

3. **Autentique com sua org**
   ```bash
   sf org login web -d -a DevOrg
   ```

4. **Deploy o projeto**
   ```bash
   sf project deploy start -o DevOrg
   ```

5. **Abra a org**
   ```bash
   sf org open -o DevOrg
   ```

## 🧪 Executando os Testes

```bash
# Executar todos os testes
npm run test

# Executar testes em modo watch
npm run test:unit:watch

# Executar testes com coverage
npm run test:unit:coverage

# Executar linting
npm run lint
```

## 📁 Estrutura do Projeto

```
EventManagementSystem/
├── 📂 force-app/main/default/
│   ├── 📂 classes/           # Classes Apex
│   ├── 📂 lwc/              # Lightning Web Components
│   ├── 📂 objects/          # Custom Objects
│   ├── 📂 tabs/             # Abas customizadas
│   └── 📂 applications/     # Lightning Apps
├── 📂 config/               # Configurações do projeto
├── 📂 scripts/              # Scripts auxiliares
├── 📄 sfdx-project.json     # Configuração do projeto SFDX
└── 📄 package.json          # Dependências Node.js
```

## 🎯 Roadmap de Desenvolvimento

- [x] Configuração inicial do projeto
- [x] Setup de linting e formatação
- [ ] Implementação dos Custom Objects
- [ ] Desenvolvimento dos LWCs principais
- [ ] Criação das classes Apex
- [ ] Testes unitários
- [ ] Interface de usuário
- [ ] Documentação técnica

## 🤝 Como Contribuir

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📝 Scripts Disponíveis

| Comando | Descrição |
|---------|-----------|
| `npm run lint` | Executa o ESLint nos arquivos JavaScript |
| `npm run test` | Executa todos os testes unitários |
| `npm run test:unit:watch` | Executa testes em modo watch |
| `npm run test:unit:coverage` | Gera relatório de cobertura de testes |
| `npm run prettier` | Formata todos os arquivos do projeto |
| `npm run prettier:verify` | Verifica formatação dos arquivos |

## 📚 Recursos e Documentação

- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Lightning Web Components](https://developer.salesforce.com/docs/component-library/documentation/en/lwc)
- [Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/)
- [Trailhead - Salesforce Learning Platform](https://trailhead.salesforce.com/)

## 👨‍💻 Autor

**Victor Brandão**
- GitHub: [@victorbrandaao](https://github.com/victorbrandaao)
- LinkedIn: [Victor Brandão](https://linkedin.com/in/victor-brandao)

## 📄 Licença

Este projeto é parte da minha jornada de aprendizado em Salesforce e está disponível para fins educacionais.

---

<div align="center">

*Desenvolvido com ❤️ durante minha jornada de aprendizado em Salesforce*

**[⬆ Voltar ao topo](#-event-management-system)**

</div>
