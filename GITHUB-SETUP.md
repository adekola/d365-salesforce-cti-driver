# 🚀 GitHub Repository Setup Guide

## Quick Steps to Deploy Your CTI Driver

### **1. Create GitHub Repository**

1. Go to [github.com](https://github.com) and sign in
2. Click **"New repository"** or go to [github.com/new](https://github.com/new)
3. **Repository settings**:
   - **Name**: `d365-salesforce-cti-driver` (or your preferred name)
   - **Description**: `Microsoft Dynamics 365 Contact Center CTI Driver for Salesforce`
   - **Visibility**: Public (required for free GitHub Pages)
   - ✅ **Add a README file** (uncheck - we have our own)
   - ✅ **Add .gitignore** (uncheck - we have our own)
   - ✅ **Choose a license** (uncheck - we have MIT license)

4. Click **"Create repository"**

### **2. Upload Files to GitHub**

**Option A: Using Git Commands** (Recommended)

```bash
# Add all files to Git
git add .

# Commit files
git commit -m "Initial commit: Add Dynamics 365 Contact Center CTI Driver for Salesforce"

# Add your GitHub repository as remote
git remote add origin https://github.com/[your-username]/[repository-name].git

# Push to GitHub
git push -u origin main
```

**Option B: Using GitHub Web Interface**

1. Click **"uploading an existing file"** on your new repository page
2. Drag and drop all files from this folder
3. Add commit message: `Initial commit: Add CTI Driver files`
4. Click **"Commit changes"**

### **3. Enable GitHub Pages**

1. Go to your repository on GitHub
2. Click **"Settings"** tab
3. Scroll down to **"Pages"** in the left sidebar
4. **Source**: Select **"Deploy from a branch"**
5. **Branch**: Select **"main"** (or "master")
6. **Folder**: Select **"/ (root)"**
7. Click **"Save"**

### **4. Get Your CDN URL**

After enabling Pages, your CTI driver will be available at:
```
https://[your-username].github.io/[repository-name]/SFExampleCTIDriver.js
```

**Example:**
- Username: `john-doe`
- Repository: `dynamics365-salesforce-cti-driver`
- **CDN URL**: `https://john-doe.github.io/dynamics365-salesforce-cti-driver/SFExampleCTIDriver.js`

### **5. Configure Salesforce**

Use this URL in your Salesforce Call Center configuration:
```
https://ccaas-embed-prod.azureedge.net/widget/index.html?dynamicsUrl=<YOUR_D365_URL>&ctiDriverUrl=https://[your-username].github.io/[repository-name]/SFExampleCTIDriver.js
```

### **6. Add Remote Site Settings**

In Salesforce Setup → Security → Remote Site Settings, add:
- `https://ccaas-embed-prod.azureedge.net`
- `https://[your-username].github.io`
- `https://[your-dynamics365-domain].dynamics.com`

---

## 🎯 **Repository Features**

### **✅ What's Included**
- **Production-ready CTI driver** (`SFExampleCTIDriver.js`)
- **Comprehensive documentation** (README.md, guides)
- **Testing page** (`test.html`)
- **Deployment helpers** (`deploy.ps1`, `deploy.sh`)
- **GitHub Actions workflow** (automatic deployments)
- **MIT License** (open source friendly)

### **🔄 Automatic Deployments**
- Every time you push changes to `main` branch
- GitHub Actions automatically deploys to Pages
- No manual deployment needed

### **📊 Built-in Analytics**
- GitHub provides basic traffic analytics
- See how many people access your CTI driver
- Monitor usage patterns

---

## 🛠️ **Git Commands Reference**

### **First Time Setup**
```bash
# Configure Git (if not done before)
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Initialize repository (already done)
git init

# Add files
git add .

# Initial commit
git commit -m "Initial commit: Add CTI Driver"

# Connect to GitHub
git remote add origin https://github.com/[username]/[repo].git

# Push to GitHub
git push -u origin main
```

### **Future Updates**
```bash
# After making changes to files
git add .
git commit -m "Update: Description of changes"
git push
```

### **Check Status**
```bash
# See which files have changed
git status

# See commit history
git log --oneline
```

---

## 🔧 **Troubleshooting**

### **"Repository not found" error**
- Double-check repository name in remote URL
- Ensure you have push access to the repository

### **GitHub Pages not working**
- Ensure repository is public
- Check that Pages is enabled in repository settings
- Wait 5-10 minutes for initial deployment

### **CTI driver not loading from GitHub Pages**
- Verify the file exists at the GitHub Pages URL
- Check browser console for CORS errors
- Ensure Salesforce Remote Site Settings include GitHub domain

### **Authentication issues**
```bash
# If you have 2FA enabled, use personal access token
# Go to GitHub → Settings → Developer settings → Personal access tokens
# Use token as password when prompted
```

---

## 📚 **Next Steps**

1. **Test the integration** using `test.html`
2. **Configure Salesforce** with your GitHub Pages URL
3. **Share the repository** with your team
4. **Star the repository** ⭐ to bookmark it
5. **Watch the repository** to get notified of any updates

Your CTI driver is now hosted on a reliable, free CDN with automatic deployments! 🎉
