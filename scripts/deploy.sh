#!/bin/bash
# Quick deployment scripts for various CDN options

echo "🚀 CDN Deployment Helper for SFExampleCTIDriver.js"
echo "=================================================="

# Check if the built file exists
if [ ! -f "SFExampleCTIDriver.js" ]; then
    echo "❌ Error: SFExampleCTIDriver.js not found in current directory"
    echo "   Please run 'npm run build' first"
    exit 1
fi

echo "✅ Found SFExampleCTIDriver.js ($(du -h SFExampleCTIDriver.js | cut -f1))"
echo ""

echo "📋 Available deployment options:"
echo "1. Netlify (Recommended for quick start)"
echo "2. Vercel (Modern platform)"
echo "3. GitHub Pages (Free hosting)"
echo "4. Azure Storage + CDN (Enterprise)"
echo "5. AWS S3 + CloudFront (Enterprise)"
echo ""

read -p "Select option (1-5): " choice

case $choice in
    1)
        echo "🌐 Deploying to Netlify..."
        
        # Create _headers file for CORS
        cat > _headers << 'EOF'
/SFExampleCTIDriver.js
  Access-Control-Allow-Origin: https://*.salesforce.com
  Cache-Control: public, max-age=31536000
  Content-Type: application/javascript

/*
  X-Frame-Options: SAMEORIGIN
  X-Content-Type-Options: nosniff
EOF

        echo "✅ Created _headers file for CORS configuration"
        echo "📤 Next steps:"
        echo "   1. Go to https://netlify.com"
        echo "   2. Drag & drop this entire folder to deploy"
        echo "   3. Your CDN URL will be: https://[site-name].netlify.app/SFExampleCTIDriver.js"
        ;;
        
    2)
        echo "⚡ Preparing for Vercel deployment..."
        
        # Create vercel.json for configuration
        cat > vercel.json << 'EOF'
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
EOF

        echo "✅ Created vercel.json configuration"
        echo "📤 Next steps:"
        echo "   1. Install Vercel CLI: npm i -g vercel"
        echo "   2. Run: vercel --prod"
        echo "   3. Your CDN URL will be: https://[project].vercel.app/SFExampleCTIDriver.js"
        ;;
        
    3)
        echo "🐙 Preparing for GitHub Pages..."
        
        # Create a simple index.html for GitHub Pages
        cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>CTI Driver CDN</title>
</head>
<body>
    <h1>Microsoft Dynamics 365 Contact Center - CTI Driver</h1>
    <p>This repository hosts the Salesforce CTI driver for Microsoft Dynamics 365 Contact Center integration.</p>
    <p><strong>CDN URL:</strong> <code>https://[username].github.io/[repository]/SFExampleCTIDriver.js</code></p>
    <p><a href="SFExampleCTIDriver.js">Download CTI Driver</a></p>
</body>
</html>
EOF

        echo "✅ Created index.html for GitHub Pages"
        echo "📤 Next steps:"
        echo "   1. Create a new GitHub repository"
        echo "   2. Push these files to the repository"
        echo "   3. Enable GitHub Pages in repository settings"
        echo "   4. Your CDN URL will be: https://[username].github.io/[repo]/SFExampleCTIDriver.js"
        ;;
        
    4)
        echo "☁️ Azure deployment guide..."
        echo "📤 Steps for Azure CDN:"
        echo "   1. Create Azure Storage Account"
        echo "   2. Enable 'Static website' in Storage Account"
        echo "   3. Upload SFExampleCTIDriver.js to \$web container"
        echo "   4. Create CDN Profile and Endpoint"
        echo "   5. Configure CORS in Storage Account settings"
        echo "   6. Your CDN URL will be: https://[endpoint].azureedge.net/SFExampleCTIDriver.js"
        echo ""
        echo "💡 CORS Configuration for Azure Storage:"
        echo "   - Allowed origins: https://*.salesforce.com"
        echo "   - Allowed methods: GET"
        echo "   - Max age: 86400"
        ;;
        
    5)
        echo "🚀 AWS deployment guide..."
        echo "📤 Steps for AWS CloudFront:"
        echo "   1. Create S3 bucket with public read access"
        echo "   2. Upload SFExampleCTIDriver.js to bucket"
        echo "   3. Create CloudFront distribution"
        echo "   4. Configure CORS policy on S3 bucket"
        echo "   5. Your CDN URL will be: https://[distribution].cloudfront.net/SFExampleCTIDriver.js"
        echo ""
        echo "💡 S3 CORS Configuration:"
        echo '   [{
        "AllowedOrigins": ["https://*.salesforce.com"],
        "AllowedMethods": ["GET"],
        "AllowedHeaders": ["*"]
   }]'
        ;;
        
    *)
        echo "❌ Invalid option selected"
        exit 1
        ;;
esac

echo ""
echo "📋 Remember to update your Salesforce Call Center configuration with:"
echo "https://ccaas-embed-prod.azureedge.net/widget/index.html?dynamicsUrl=<YOUR_D365_URL>&ctiDriverUrl=<YOUR_CDN_URL>"
echo ""
echo "🔧 Required Salesforce Remote Site Settings:"
echo "   - https://ccaas-embed-prod.azureedge.net"
echo "   - Your CDN domain"
echo "   - Your Dynamics 365 domain"
