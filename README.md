# Microsoft Dynamics 365 Contact Center - Salesforce CTI Driver

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CDN Ready](https://img.shields.io/badge/CDN-Ready-green.svg)](https://github.com)
[![Salesforce Compatible](https://img.shields.io/badge/Salesforce-Compatible-blue.svg)](https://salesforce.com)

A production-ready CTI (Computer Telephony Integration) driver that enables seamless integration between **Microsoft Dynamics 365 Contact Center** and **Salesforce CRM**.

## 🚀 **Live CDN URL**

Access the CTI driver directly from GitHub Pages:

```
https://adekola.github.io/d365-salesforce-cti-driver/SFExampleCTIDriver.js
```

## 📋 **Quick Setup**

### **1. Salesforce Configuration**

Add this URL to your Salesforce Call Center configuration:

```
https://ccaas-embed-prod.azureedge.net/widget/index.html?dynamicsUrl=<YOUR_D365_URL>&ctiDriverUrl=https://adekola.github.io/d365-salesforce-cti-driver/SFExampleCTIDriver.js
```

### **2. Required Remote Site Settings**

Add these domains to Salesforce Setup → Security → Remote Site Settings:

- `https://ccaas-embed-prod.azureedge.net`
- `https://[your-username].github.io`
- `https://[your-dynamics365-domain].dynamics.com`

## ✨ **Features**

### **🎯 Core CTI Functionality**
- ✅ **Screen Pop** - Automatic customer record display on incoming calls
- ✅ **Click-to-Dial** - Call directly from Salesforce records
- ✅ **Call Controls** - Hold, mute, transfer, and conference
- ✅ **Presence Management** - Real-time agent availability sync

### **📞 Conversation Management**
- ✅ **Real-time Status Updates** - Active, wrap-up, closed states
- ✅ **Message Handling** - Live chat and messaging support
- ✅ **Transfer & Consult** - Seamless call transfers and consultations
- ✅ **Transcript Retrieval** - Access conversation history

### **🤖 AI-Powered Features**
- ✅ **Customer Sentiment Analysis** - Real-time mood tracking
- ✅ **Copilot Integration** - AI assistance for agents
- ✅ **Smart Notifications** - Intelligent alert system

### **🔗 CRM Integration**
- ✅ **Contact/Account Matching** - Automatic record identification
- ✅ **Dataverse Access** - Direct integration with Dynamics 365 data
- ✅ **Softphone Panel** - Embedded CTI controls in Salesforce

## 📁 **Built File**

The compiled CTI driver is available as:
- **File**: `SFExampleCTIDriver.js`
- **Size**: 9 KB (minified)
- **Dependencies**: None (self-contained)

## 🌐 **CDN Deployment**

### **GitHub Pages (Current Setup)**
1. **Upload to your repository**:
   - Push `SFExampleCTIDriver.js` to your GitHub repository
   - Enable GitHub Pages in repository settings
   - Access via: `https://[username].github.io/[repo]/SFExampleCTIDriver.js`

2. **CORS Configuration**:
   - GitHub Pages automatically allows cross-origin requests from Salesforce domains
   - Pre-configured headers:
     ```
     Access-Control-Allow-Origin: https://*.salesforce.com
     Access-Control-Allow-Methods: GET
     ```

## Salesforce Integration

### Method 1: Open CTI Configuration

1. **Setup → Call Centers → Create Call Center**
2. **Add the CCaaS Widget URL**:
   ```
   https://ccaas-embed-prod.azureedge.net/widget/index.html?dynamicsUrl=<YOUR_D365_URL>&ctiDriverUrl=<YOUR_CDN_URL>
   ```

   Replace:
   - `<YOUR_D365_URL>`: Your Dynamics 365 Contact Center URL
   - `<YOUR_CDN_URL>`: Your CDN URL (e.g., `https://your-cdn.com/path/SFExampleCTIDriver.js`)

### Method 2: Lightning Component Integration

Create a Lightning component that loads the CTI driver:

```javascript
// In your Lightning component
connectedCallback() {
    // Load CCaaS widget with your CDN URL
    const widgetUrl = 'https://ccaas-embed-prod.azureedge.net/widget/index.html' +
        '?dynamicsUrl=<YOUR_D365_URL>' +
        '&ctiDriverUrl=<YOUR_CDN_URL>';
    
    // Embed in iframe or load directly
}
```

## Required Salesforce Permissions

1. **Call Center User** profile assignment
2. **OpenCTI API** access
3. **Lightning Experience** enabled
4. **Remote Site Settings** for:
   - `https://ccaas-embed-prod.azureedge.net`
   - Your CDN domain
   - Your Dynamics 365 domain

## Features Included

- ✅ Screen Pop functionality
- ✅ Click-to-dial integration
- ✅ Conversation management
- ✅ Agent presence control
- ✅ Call controls (hold, mute, transfer)
- ✅ Transcript retrieval
- ✅ Customer sentiment tracking
- ✅ Dataverse integration

## Testing

1. **Verify CTI driver loads**: Check browser console for initialization messages
2. **Test screen pop**: Make a test call to verify customer records appear
3. **Test click-to-dial**: Click phone numbers in Salesforce records
4. **Verify presence**: Check agent status synchronization

## Troubleshooting

- **404 errors**: Verify CDN URL is correct and publicly accessible
- **CORS errors**: Check CDN CORS configuration
- **Loading issues**: Verify Salesforce Remote Site Settings
- **API errors**: Check Dynamics 365 permissions and connectivity
