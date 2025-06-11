# PowerShell deployment script for CDN hosting
# Quick deployment helper for SFExampleCTIDriver.js

Write-Host "🚀 CDN Deployment Helper for SFExampleCTIDriver.js" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green

# Check if the built file exists
if (-not (Test-Path "SFExampleCTIDriver.js")) {
    Write-Host "❌ Error: SFExampleCTIDriver.js not found in current directory" -ForegroundColor Red
    Write-Host "   Please run 'npm run build' first" -ForegroundColor Yellow
    exit 1
}

$fileSize = (Get-Item "SFExampleCTIDriver.js").Length
Write-Host "✅ Found SFExampleCTIDriver.js ($([math]::Round($fileSize/1KB, 2)) KB)" -ForegroundColor Green
Write-Host ""

Write-Host "📋 Available deployment options:" -ForegroundColor Cyan
Write-Host "1. Netlify (Recommended for quick start)" -ForegroundColor White
Write-Host "2. Vercel (Modern platform)" -ForegroundColor White
Write-Host "3. GitHub Pages (Free hosting)" -ForegroundColor White
Write-Host "4. Azure Storage + CDN (Enterprise)" -ForegroundColor White
Write-Host "5. AWS S3 + CloudFront (Enterprise)" -ForegroundColor White
Write-Host ""

$choice = Read-Host "Select option (1-5)"

switch ($choice) {
    "1" {
        Write-Host "🌐 Preparing Netlify deployment..." -ForegroundColor Blue
        
        # Create _headers file for CORS
        @"
/SFExampleCTIDriver.js
  Access-Control-Allow-Origin: https://*.salesforce.com
  Cache-Control: public, max-age=31536000
  Content-Type: application/javascript

/*
  X-Frame-Options: SAMEORIGIN
  X-Content-Type-Options: nosniff
"@ | Out-File -FilePath "_headers" -Encoding UTF8

        Write-Host "✅ Created _headers file for CORS configuration" -ForegroundColor Green
        Write-Host "📤 Next steps:" -ForegroundColor Yellow
        Write-Host "   1. Go to https://netlify.com" -ForegroundColor White
        Write-Host "   2. Drag & drop this entire folder to deploy" -ForegroundColor White
        Write-Host "   3. Your CDN URL will be: https://[site-name].netlify.app/SFExampleCTIDriver.js" -ForegroundColor White
    }
    
    "2" {
        Write-Host "⚡ Preparing Vercel deployment..." -ForegroundColor Blue
        
        # Create vercel.json for configuration
        @"
{
  "headers": [
    {
      "source": "/SFExampleCTIDriver.js",
      "headers": [
        {
          "key": "Access-Control-Allow-Origin",
          "value": "https://*.salesforce.com"
        },
        {
          "key": "Cache-Control",
          "value": "public, max-age=31536000"
        },
        {
          "key": "Content-Type",
          "value": "application/javascript"
        }
      ]
    }
  ]
}
"@ | Out-File -FilePath "vercel.json" -Encoding UTF8

        Write-Host "✅ Created vercel.json configuration" -ForegroundColor Green
        Write-Host "📤 Next steps:" -ForegroundColor Yellow
        Write-Host "   1. Install Vercel CLI: npm i -g vercel" -ForegroundColor White
        Write-Host "   2. Run: vercel --prod" -ForegroundColor White
        Write-Host "   3. Your CDN URL will be: https://[project].vercel.app/SFExampleCTIDriver.js" -ForegroundColor White
    }
    
    "3" {
        Write-Host "🐙 Preparing GitHub Pages deployment..." -ForegroundColor Blue
        
        # Create a simple index.html for GitHub Pages
        @"
<!DOCTYPE html>
<html>
<head>
    <title>CTI Driver CDN</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        code { background: #f4f4f4; padding: 2px 4px; border-radius: 3px; }
    </style>
</head>
<body>
    <h1>Microsoft Dynamics 365 Contact Center - CTI Driver</h1>
    <p>This repository hosts the Salesforce CTI driver for Microsoft Dynamics 365 Contact Center integration.</p>
    <p><strong>CDN URL:</strong> <code>https://[username].github.io/[repository]/SFExampleCTIDriver.js</code></p>
    <p><a href="SFExampleCTIDriver.js">Download CTI Driver</a> ($(([math]::Round((Get-Item "SFExampleCTIDriver.js").Length/1KB, 2))) KB)</p>
    <h2>Integration Instructions</h2>
    <ol>
        <li>Use this URL in your Salesforce Call Center configuration</li>
        <li>Configure Remote Site Settings for required domains</li>
        <li>Assign Call Center permissions to users</li>
    </ol>
</body>
</html>
"@ | Out-File -FilePath "index.html" -Encoding UTF8

        Write-Host "✅ Created index.html for GitHub Pages" -ForegroundColor Green
        Write-Host "📤 Next steps:" -ForegroundColor Yellow
        Write-Host "   1. Create a new GitHub repository" -ForegroundColor White
        Write-Host "   2. Push these files to the repository:" -ForegroundColor White
        Write-Host "      git init" -ForegroundColor Gray
        Write-Host "      git add ." -ForegroundColor Gray
        Write-Host "      git commit -m 'Add CTI driver'" -ForegroundColor Gray
        Write-Host "      git remote add origin https://github.com/username/repo.git" -ForegroundColor Gray
        Write-Host "      git push -u origin main" -ForegroundColor Gray
        Write-Host "   3. Enable GitHub Pages in repository settings" -ForegroundColor White
        Write-Host "   4. Your CDN URL will be: https://[username].github.io/[repo]/SFExampleCTIDriver.js" -ForegroundColor White
    }
    
    "4" {
        Write-Host "☁️ Azure deployment guide..." -ForegroundColor Blue
        Write-Host "📤 Steps for Azure CDN:" -ForegroundColor Yellow
        Write-Host "   1. Create Azure Storage Account" -ForegroundColor White
        Write-Host "   2. Enable 'Static website' in Storage Account" -ForegroundColor White
        Write-Host "   3. Upload SFExampleCTIDriver.js to `$web container" -ForegroundColor White
        Write-Host "   4. Create CDN Profile and Endpoint" -ForegroundColor White
        Write-Host "   5. Configure CORS in Storage Account settings" -ForegroundColor White
        Write-Host "   6. Your CDN URL will be: https://[endpoint].azureedge.net/SFExampleCTIDriver.js" -ForegroundColor White
        Write-Host ""
        Write-Host "💡 CORS Configuration for Azure Storage:" -ForegroundColor Cyan
        Write-Host "   - Allowed origins: https://*.salesforce.com" -ForegroundColor White
        Write-Host "   - Allowed methods: GET" -ForegroundColor White
        Write-Host "   - Max age: 86400" -ForegroundColor White
        
        # Create Azure CLI commands file
        @"
# Azure CLI commands for deployment
# Run these commands after installing Azure CLI

# Login to Azure
az login

# Create resource group
az group create --name "cti-driver-rg" --location "East US"

# Create storage account
az storage account create --name "ctidriverstorage" --resource-group "cti-driver-rg" --location "East US" --sku "Standard_LRS"

# Enable static website
az storage blob service-properties update --account-name "ctidriverstorage" --static-website --index-document "index.html"

# Upload file
az storage blob upload --account-name "ctidriverstorage" --container-name "`$web" --name "SFExampleCTIDriver.js" --file "SFExampleCTIDriver.js"

# Create CDN profile
az cdn profile create --name "cti-driver-cdn" --resource-group "cti-driver-rg" --sku "Standard_Microsoft"

# Create CDN endpoint
az cdn endpoint create --name "cti-driver-endpoint" --profile-name "cti-driver-cdn" --resource-group "cti-driver-rg" --origin "ctidriverstorage.z13.web.core.windows.net"
"@ | Out-File -FilePath "azure-deploy.sh" -Encoding UTF8

        Write-Host "✅ Created azure-deploy.sh with Azure CLI commands" -ForegroundColor Green
    }
    
    "5" {
        Write-Host "🚀 AWS deployment guide..." -ForegroundColor Blue
        Write-Host "📤 Steps for AWS CloudFront:" -ForegroundColor Yellow
        Write-Host "   1. Create S3 bucket with public read access" -ForegroundColor White
        Write-Host "   2. Upload SFExampleCTIDriver.js to bucket" -ForegroundColor White
        Write-Host "   3. Create CloudFront distribution" -ForegroundColor White
        Write-Host "   4. Configure CORS policy on S3 bucket" -ForegroundColor White
        Write-Host "   5. Your CDN URL will be: https://[distribution].cloudfront.net/SFExampleCTIDriver.js" -ForegroundColor White
        Write-Host ""
        Write-Host "💡 S3 CORS Configuration:" -ForegroundColor Cyan
        
        # Create AWS CORS configuration
        @"
[{
    "AllowedOrigins": ["https://*.salesforce.com"],
    "AllowedMethods": ["GET"],
    "AllowedHeaders": ["*"],
    "MaxAgeSeconds": 86400
}]
"@ | Out-File -FilePath "aws-cors-policy.json" -Encoding UTF8

        Write-Host "✅ Created aws-cors-policy.json" -ForegroundColor Green
        Write-Host "   Apply this CORS policy to your S3 bucket" -ForegroundColor White
    }
    
    default {
        Write-Host "❌ Invalid option selected" -ForegroundColor Red
        exit 1
    }
}

Write-Host ""
Write-Host "📋 Remember to update your Salesforce Call Center configuration with:" -ForegroundColor Cyan
Write-Host "https://ccaas-embed-prod.azureedge.net/widget/index.html?dynamicsUrl=<YOUR_D365_URL>&ctiDriverUrl=<YOUR_CDN_URL>" -ForegroundColor Yellow
Write-Host ""
Write-Host "🔧 Required Salesforce Remote Site Settings:" -ForegroundColor Cyan
Write-Host "   - https://ccaas-embed-prod.azureedge.net" -ForegroundColor White
Write-Host "   - Your CDN domain" -ForegroundColor White
Write-Host "   - Your Dynamics 365 domain" -ForegroundColor White
Write-Host ""
Write-Host "✅ Deployment preparation complete!" -ForegroundColor Green
