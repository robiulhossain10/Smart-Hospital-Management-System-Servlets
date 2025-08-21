<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System - Admin Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    animation: {
                        'fade-in': 'fadeIn 0.5s ease-in-out',
                        'slide-in': 'slideIn 0.3s ease-out',
                        'pulse-soft': 'pulse 3s infinite',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0', transform: 'translateY(10px)' },
                            '100%': { opacity: '1', transform: 'translateY(0)' }
                        },
                        slideIn: {
                            '0%': { transform: 'translateX(-100%)' },
                            '100%': { transform: 'translateX(0)' }
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gradient-to-br from-slate-50 to-blue-50 font-sans antialiased">
    <!-- Mobile Menu Overlay -->
    <div id="mobileOverlay" class="fixed inset-0 bg-black bg-opacity-50 z-40 hidden lg:hidden"></div>
    
    <div class="flex h-screen overflow-hidden">
        <!-- Enhanced Sidebar -->
        <aside id="sidebar" class="bg-gradient-to-b from-blue-900 via-blue-800 to-blue-700 text-white w-72 flex-shrink-0 flex flex-col shadow-2xl transform -translate-x-full lg:translate-x-0 transition-all duration-300 z-50 fixed lg:relative h-full">
            <!-- Header -->
            <div class="p-6 border-b border-blue-600/30 bg-blue-900/50 backdrop-blur-sm">
                <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-3">
                        <div class="w-10 h-10 bg-white/20 rounded-xl flex items-center justify-center backdrop-blur-sm">
                            <svg class="w-6 h-6 text-blue-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                            </svg>
                        </div>
                        <div>
                            <h1 class="text-xl font-bold">MediCore</h1>
                            <p class="text-xs text-blue-200">Hospital Management</p>
                        </div>
                    </div>
                    <button id="closeSidebar" class="lg:hidden text-white/70 hover:text-white">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Navigation -->
            <nav class="flex-1 p-6 space-y-2 overflow-y-auto">
                <div class="mb-6">
                    <h3 class="text-xs font-semibold text-blue-200 uppercase tracking-wide mb-3">Main Menu</h3>
                    <div class="space-y-1">
                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl bg-white/10 backdrop-blur-sm border border-white/10 transition-all duration-200 hover:bg-white/20">
                            <div class="p-2 bg-blue-500/20 rounded-lg group-hover:bg-blue-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2-2z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Dashboard</span>
                        </a>
                        
                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-green-500/20 rounded-lg group-hover:bg-green-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Patients</span>
                        </a>

                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-purple-500/20 rounded-lg group-hover:bg-purple-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Doctors</span>
                        </a>

                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-orange-500/20 rounded-lg group-hover:bg-orange-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H3v12a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Appointments</span>
                        </a>

                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-red-500/20 rounded-lg group-hover:bg-red-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19.428 15.428a2 2 0 00-1.022-.547l-2.387-.477a6 6 0 00-3.86.517l-.318.158a6 6 0 01-3.86.517L6.05 15.21a2 2 0 00-1.806.547M8 4h8l-1 1v5.172a2 2 0 00.586 1.414l5 5c1.26 1.26.367 3.414-1.415 3.414H4.828c-1.782 0-2.674-2.154-1.414-3.414l5-5A2 2 0 009 10.172V5L8 4z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Laboratory</span>
                        </a>
                    </div>
                </div>

                <div class="mb-6">
                    <h3 class="text-xs font-semibold text-blue-200 uppercase tracking-wide mb-3">Analytics</h3>
                    <div class="space-y-1">
                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-indigo-500/20 rounded-lg group-hover:bg-indigo-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Reports</span>
                        </a>

                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-yellow-500/20 rounded-lg group-hover:bg-yellow-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 1.343-3 3s1.343 3 3 3 3-1.343 3-3-1.343-3-3-3z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 1v6m0 6v6m5.657-5.657l-4.24-4.24m0 0L9.172 12l4.243 4.243m4.243-4.243L12 7.757"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Analytics</span>
                        </a>
                    </div>
                </div>

                <div>
                    <h3 class="text-xs font-semibold text-blue-200 uppercase tracking-wide mb-3">Settings</h3>
                    <div class="space-y-1">
                        <a href="#" class="group flex items-center gap-3 p-3 rounded-xl transition-all duration-200 hover:bg-white/10">
                            <div class="p-2 bg-gray-500/20 rounded-lg group-hover:bg-gray-400/30 transition-colors">
                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                                </svg>
                            </div>
                            <span class="font-medium">Settings</span>
                        </a>
                    </div>
                </div>
            </nav>

            <!-- User Profile -->
            <div class="p-6 border-t border-blue-600/30 bg-blue-900/30 backdrop-blur-sm">
                <div class="flex items-center space-x-3">
                    <div class="w-10 h-10 bg-gradient-to-r from-blue-400 to-purple-500 rounded-full flex items-center justify-center">
                        <span class="text-white font-semibold text-sm">AD</span>
                    </div>
                    <div class="flex-1">
                        <p class="font-medium text-sm">Dr. Admin</p>
                        <p class="text-xs text-blue-200">System Administrator</p>
                    </div>
                    <button class="text-blue-200 hover:text-white transition-colors">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <div class="flex-1 flex flex-col min-w-0">
            <!-- Enhanced Header -->
            <header class="bg-white/80 backdrop-blur-xl shadow-sm border-b border-gray-200/50 px-6 py-4 sticky top-0 z-30">
                <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                        <button id="openSidebar" class="lg:hidden text-gray-600 hover:text-gray-900 transition-colors">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                            </svg>
                        </button>
                        <div>
                            <h2 class="text-2xl font-bold bg-gradient-to-r from-gray-900 to-blue-600 bg-clip-text text-transparent">
                                Dashboard Overview
                            </h2>
                            <p class="text-sm text-gray-500 mt-1">Welcome back! Here's what's happening at your hospital today.</p>
                        </div>
                    </div>
                    
                    <div class="flex items-center space-x-4">
                        <!-- Search Bar -->
                        <div class="relative hidden md:block">
                            <input type="text" placeholder="Search patients, doctors..." class="w-64 pl-10 pr-4 py-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent bg-gray-50/50">
                            <svg class="w-5 h-5 text-gray-400 absolute left-3 top-1/2 transform -translate-y-1/2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                            </svg>
                        </div>

                        <!-- Notifications -->
                        <div class="relative">
                            <button class="relative p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-xl transition-colors">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-3.406-3.406c-.737-.737-1.146-1.732-1.146-2.776V9c0-3.216-2.57-5.823-5.756-6-.26-.014-.521-.014-.782 0C6.691 3.177 4.121 5.784 4.121 9v1.818c0 1.044-.41 2.039-1.146 2.776L0 17h5m10 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
                                </svg>
                                <span class="absolute -top-1 -right-1 w-5 h-5 bg-red-500 text-white text-xs rounded-full flex items-center justify-center animate-pulse">3</span>
                            </button>
                        </div>

                        <!-- Profile Dropdown -->
                        <div class="relative">
                            <button class="flex items-center space-x-2 p-2 rounded-xl hover:bg-gray-100 transition-colors">
                                <div class="w-8 h-8 bg-gradient-to-r from-blue-500 to-purple-600 rounded-full flex items-center justify-center">
                                    <span class="text-white font-semibold text-xs">AD</span>
                                </div>
                                <span class="hidden md:block text-sm font-medium text-gray-700">Dr. Admin</span>
                            </button>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Main Content Area -->
            <main class="flex-1 overflow-auto p-6 space-y-8">
                <!-- Stats Cards -->
                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 animate-fade-in">
                    <!-- Total Patients -->
                    <div class="group bg-white/70 backdrop-blur-xl p-6 rounded-2xl shadow-lg border border-white/20 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                        <div class="flex items-center justify-between mb-4">
                            <div class="p-3 bg-gradient-to-r from-blue-500 to-blue-600 rounded-xl shadow-lg group-hover:scale-110 transition-transform duration-300">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                                </svg>
                            </div>
                            <span class="text-2xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-user-cog-icon lucide-user-cog"><path d="M10 15H6a4 4 0 0 0-4 4v2"/><path d="m14.305 16.53.923-.382"/><path d="m15.228 13.852-.923-.383"/><path d="m16.852 12.228-.383-.923"/><path d="m16.852 17.772-.383.924"/><path d="m19.148 12.228.383-.923"/><path d="m19.53 18.696-.382-.924"/><path d="m20.772 13.852.924-.383"/><path d="m20.772 16.148.924.383"/><circle cx="18" cy="15" r="3"/><circle cx="9" cy="7" r="4"/></svg></span>
                        </div>
                        <div>
                            <h3 class="text-gray-600 text-sm font-medium mb-1">Total Patients</h3>
                            <p class="text-3xl font-bold text-gray-900 mb-2">1,247</p>
                            <p class="text-sm text-green-600 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                +12% from last month
                            </p>
                        </div>
                    </div>

                    <!-- Total Doctors -->
                    <div class="group bg-white/70 backdrop-blur-xl p-6 rounded-2xl shadow-lg border border-white/20 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                        <div class="flex items-center justify-between mb-4">
                            <div class="p-3 bg-gradient-to-r from-green-500 to-green-600 rounded-xl shadow-lg group-hover:scale-110 transition-transform duration-300">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                            </div>
                            <span class="text-2xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-hospital-icon lucide-hospital"><path d="M12 7v4"/><path d="M14 21v-3a2 2 0 0 0-4 0v3"/><path d="M14 9h-4"/><path d="M18 11h2a2 2 0 0 1 2 2v6a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2v-9a2 2 0 0 1 2-2h2"/><path d="M18 21V5a2 2 0 0 0-2-2H8a2 2 0 0 0-2 2v16"/></svg></span>
                        </div>
                        <div>
                            <h3 class="text-gray-600 text-sm font-medium mb-1">Total Doctors</h3>
                            <p class="text-3xl font-bold text-gray-900 mb-2">89</p>
                            <p class="text-sm text-green-600 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                +5 new this month
                            </p>
                        </div>
                    </div>

                    <!-- Appointments Today -->
                    <div class="group bg-white/70 backdrop-blur-xl p-6 rounded-2xl shadow-lg border border-white/20 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                        <div class="flex items-center justify-between mb-4">
                            <div class="p-3 bg-gradient-to-r from-purple-500 to-purple-600 rounded-xl shadow-lg group-hover:scale-110 transition-transform duration-300">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H3v12a2 2 0 002 2z"></path>
                                </svg>
                            </div>
                            <span class="text-2xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-clipboard-clock-icon lucide-clipboard-clock"><path d="M16 14v2.2l1.6 1"/><path d="M16 4h2a2 2 0 0 1 2 2v.832"/><path d="M8 4H6a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h2"/><circle cx="16" cy="16" r="6"/><rect x="8" y="2" width="8" height="4" rx="1"/></svg></span>
                        </div>
                        <div>
                            <h3 class="text-gray-600 text-sm font-medium mb-1">Appointments Today</h3>
                            <p class="text-3xl font-bold text-gray-900 mb-2">156</p>
                            <p class="text-sm text-orange-600 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                                23 pending
                            </p>
                        </div>
                    </div>

                    <!-- Revenue -->
                    <div class="group bg-white/70 backdrop-blur-xl p-6 rounded-2xl shadow-lg border border-white/20 hover:shadow-xl transition-all duration-300 hover:-translate-y-1">
                        <div class="flex items-center justify-between mb-4">
                            <div class="p-3 bg-gradient-to-r from-yellow-500 to-orange-500 rounded-xl shadow-lg group-hover:scale-110 transition-transform duration-300">
                                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 1.343-3 3s1.343 3 3 3 3-1.343 3-3-1.343-3-3-3z"></path>
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
                            </div>
                            <span class="text-2xl"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-dollar-sign-icon lucide-dollar-sign"><line x1="12" x2="12" y1="2" y2="22"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg></span>
                        </div>
                        <div>
                            <h3 class="text-gray-600 text-sm font-medium mb-1">Monthly Revenue</h3>
                            <p class="text-3xl font-bold text-gray-900 mb-2">$45.2K</p>
                            <p class="text-sm text-green-600 flex items-center">
                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 10l7-7m0 0l7 7m-7-7v18"></path>
                                </svg>
                                +8% from last month
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="bg-white/70 backdrop-blur-xl rounded-2xl shadow-lg border border-white/20 p-6">
                    <h3 class="text-lg font-semibold text-gray-900 mb-6 flex items-center">
                        <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path>
                        </svg>
                        Quick Actions
                    </h3>
                    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                        <button class="group bg-gradient-to-r from-blue-500 to-blue-600 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1 flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                            </svg>
                            <span class="font-semibold">Add Patient</span>
                        </button>
                        
                        <button class="group bg-gradient-to-r from-green-500 to-green-600 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1 flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                            </svg>
                            <span class="font-semibold">Add Doctor</span>
                        </button>
                        
                        <button class="group bg-gradient-to-r from-purple-500 to-purple-600 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1 flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H3v12a2 2 0 002 2z"></path>
                            </svg>
                            <span class="font-semibold">Schedule Appointment</span>
                        </button>
                        
                        <button class="group bg-gradient-to-r from-orange-500 to-red-500 text-white p-4 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 hover:-translate-y-1 flex items-center justify-center space-x-2">
                            <svg class="w-5 h-5 group-hover:scale-110 transition-transform" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                            </svg>
                            <span class="font-semibold">Generate Report</span>
                        </button>
                    </div>
                </div>

                <!-- Recent Activity & Analytics -->
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <!-- Recent Patients -->
                    <div class="bg-white/70 backdrop-blur-xl rounded-2xl shadow-lg border border-white/20 p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-lg font-semibold text-gray-900 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z"></path>
                                </svg>
                                Recent Patients
                            </h3>
                            <a href="#" class="text-blue-600 hover:text-blue-700 text-sm font-medium hover:underline">View All</a>
                        </div>
                        
                        <div class="space-y-4">
                            <div class="flex items-center space-x-4 p-4 bg-gray-50/50 rounded-xl hover:bg-gray-100/50 transition-colors">
                                <div class="w-12 h-12 bg-gradient-to-r from-blue-400 to-blue-500 rounded-full flex items-center justify-center text-white font-semibold">
                                    JS
                                </div>
                                <div class="flex-1">
                                    <h4 class="font-semibold text-gray-900">John Smith</h4>
                                    <p class="text-sm text-gray-600">Age: 45 ? ID: #P001</p>
                                    <p class="text-xs text-gray-500">Cardiology ? Dr. Johnson</p>
                                </div>
                                <div class="text-right">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                        Active
                                    </span>
                                    <p class="text-xs text-gray-500 mt-1">Today, 2:30 PM</p>
                                </div>
                            </div>
                            
                            <div class="flex items-center space-x-4 p-4 bg-gray-50/50 rounded-xl hover:bg-gray-100/50 transition-colors">
                                <div class="w-12 h-12 bg-gradient-to-r from-purple-400 to-purple-500 rounded-full flex items-center justify-center text-white font-semibold">
                                    MD
                                </div>
                                <div class="flex-1">
                                    <h4 class="font-semibold text-gray-900">Maria Davis</h4>
                                    <p class="text-sm text-gray-600">Age: 32 ? ID: #P002</p>
                                    <p class="text-xs text-gray-500">Orthopedics ? Dr. Wilson</p>
                                </div>
                                <div class="text-right">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                                        Pending
                                    </span>
                                    <p class="text-xs text-gray-500 mt-1">Today, 11:15 AM</p>
                                </div>
                            </div>
                            
                            <div class="flex items-center space-x-4 p-4 bg-gray-50/50 rounded-xl hover:bg-gray-100/50 transition-colors">
                                <div class="w-12 h-12 bg-gradient-to-r from-green-400 to-green-500 rounded-full flex items-center justify-center text-white font-semibold">
                                    RJ
                                </div>
                                <div class="flex-1">
                                    <h4 class="font-semibold text-gray-900">Robert Johnson</h4>
                                    <p class="text-sm text-gray-600">Age: 67 ? ID: #P003</p>
                                    <p class="text-xs text-gray-500">Neurology ? Dr. Brown</p>
                                </div>
                                <div class="text-right">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                        Completed
                                    </span>
                                    <p class="text-xs text-gray-500 mt-1">Yesterday, 4:45 PM</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Analytics Chart -->
                    <div class="bg-white/70 backdrop-blur-xl rounded-2xl shadow-lg border border-white/20 p-6">
                        <div class="flex items-center justify-between mb-6">
                            <h3 class="text-lg font-semibold text-gray-900 flex items-center">
                                <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"></path>
                                </svg>
                                Patient Admissions
                            </h3>
                            <select class="text-sm border border-gray-200 rounded-lg px-3 py-1 bg-white/50">
                                <option>Last 6 months</option>
                                <option>Last year</option>
                                <option>All time</option>
                            </select>
                        </div>
                        <canvas id="admissionsChart" class="w-full h-64"></canvas>
                    </div>
                </div>

                <!-- Department Overview -->
                <div class="bg-white/70 backdrop-blur-xl rounded-2xl shadow-lg border border-white/20 p-6">
                    <h3 class="text-lg font-semibold text-gray-900 mb-6 flex items-center">
                        <svg class="w-5 h-5 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
                        </svg>
                        Department Overview
                    </h3>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 p-6 rounded-xl border border-blue-200">
                            <div class="flex items-center justify-between mb-3">
                                <h4 class="font-semibold text-blue-900">Cardiology</h4>
                                <span class="text-2xl">??</span>
                            </div>
                            <div class="space-y-2">
                                <div class="flex justify-between text-sm">
                                    <span class="text-blue-700">Patients:</span>
                                    <span class="font-semibold text-blue-900">156</span>
                                </div>
                                <div class="flex justify-between text-sm">
                                    <span class="text-blue-700">Doctors:</span>
                                    <span class="font-semibold text-blue-900">12</span>
                                </div>
                                <div class="w-full bg-blue-200 rounded-full h-2">
                                    <div class="bg-blue-600 h-2 rounded-full" style="width: 85%"></div>
                                </div>
                                <p class="text-xs text-blue-600">85% Capacity</p>
                            </div>
                        </div>
                        
                        <div class="bg-gradient-to-br from-green-50 to-green-100 p-6 rounded-xl border border-green-200">
                            <div class="flex items-center justify-between mb-3">
                                <h4 class="font-semibold text-green-900">Emergency</h4>
                                <span class="text-2xl">?</span>
                            </div>
                            <div class="space-y-2">
                                <div class="flex justify-between text-sm">
                                    <span class="text-green-700">Patients:</span>
                                    <span class="font-semibold text-green-900">89</span>
                                </div>
                                <div class="flex justify-between text-sm">
                                    <span class="text-green-700">Doctors:</span>
                                    <span class="font-semibold text-green-900">8</span>
                                </div>
                                <div class="w-full bg-green-200 rounded-full h-2">
                                    <div class="bg-green-600 h-2 rounded-full" style="width: 92%"></div>
                                </div>
                                <p class="text-xs text-green-600">92% Capacity</p>
                            </div>
                        </div>
                        
                        <div class="bg-gradient-to-br from-purple-50 to-purple-100 p-6 rounded-xl border border-purple-200">
                            <div class="flex items-center justify-between mb-3">
                                <h4 class="font-semibold text-purple-900">Pediatrics</h4>
                                <span class="text-2xl">?</span>
                            </div>
                            <div class="space-y-2">
                                <div class="flex justify-between text-sm">
                                    <span class="text-purple-700">Patients:</span>
                                    <span class="font-semibold text-purple-900">134</span>
                                </div>
                                <div class="flex justify-between text-sm">
                                    <span class="text-purple-700">Doctors:</span>
                                    <span class="font-semibold text-purple-900">9</span>
                                </div>
                                <div class="w-full bg-purple-200 rounded-full h-2">
                                    <div class="bg-purple-600 h-2 rounded-full" style="width: 67%"></div>
                                </div>
                                <p class="text-xs text-purple-600">67% Capacity</p>
                            </div>
                        </div>
                        
                        <div class="bg-gradient-to-br from-orange-50 to-orange-100 p-6 rounded-xl border border-orange-200">
                            <div class="flex items-center justify-between mb-3">
                                <h4 class="font-semibold text-orange-900">Orthopedics</h4>
                                <span class="text-2xl">?</span>
                            </div>
                            <div class="space-y-2">
                                <div class="flex justify-between text-sm">
                                    <span class="text-orange-700">Patients:</span>
                                    <span class="font-semibold text-orange-900">98</span>
                                </div>
                                <div class="flex justify-between text-sm">
                                    <span class="text-orange-700">Doctors:</span>
                                    <span class="font-semibold text-orange-900">7</span>
                                </div>
                                <div class="w-full bg-orange-200 rounded-full h-2">
                                    <div class="bg-orange-600 h-2 rounded-full" style="width: 73%"></div>
                                </div>
                                <p class="text-xs text-orange-600">73% Capacity</p>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script>
        // Mobile sidebar toggle
        const openSidebar = document.getElementById('openSidebar');
        const closeSidebar = document.getElementById('closeSidebar');
        const sidebar = document.getElementById('sidebar');
        const mobileOverlay = document.getElementById('mobileOverlay');

        openSidebar.addEventListener('click', () => {
            sidebar.classList.remove('-translate-x-full');
            mobileOverlay.classList.remove('hidden');
        });

        closeSidebar.addEventListener('click', () => {
            sidebar.classList.add('-translate-x-full');
            mobileOverlay.classList.add('hidden');
        });

        mobileOverlay.addEventListener('click', () => {
            sidebar.classList.add('-translate-x-full');
            mobileOverlay.classList.add('hidden');
        });

        // Chart initialization
        const ctx = document.getElementById('admissionsChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'New Admissions',
                    data: [65, 89, 76, 102, 94, 118],
                    borderColor: 'rgb(59, 130, 246)',
                    backgroundColor: 'rgba(59, 130, 246, 0.1)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: 'rgb(59, 130, 246)',
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                    pointRadius: 6,
                    pointHoverRadius: 8
                }, {
                    label: 'Discharges',
                    data: [45, 67, 58, 78, 72, 89],
                    borderColor: 'rgb(16, 185, 129)',
                    backgroundColor: 'rgba(16, 185, 129, 0.1)',
                    borderWidth: 3,
                    fill: true,
                    tension: 0.4,
                    pointBackgroundColor: 'rgb(16, 185, 129)',
                    pointBorderColor: '#ffffff',
                    pointBorderWidth: 2,
                    pointRadius: 6,
                    pointHoverRadius: 8
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                        labels: {
                            usePointStyle: true,
                            padding: 20,
                            font: {
                                size: 12,
                                weight: '500'
                            }
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(0, 0, 0, 0.8)',
                        titleColor: 'white',
                        bodyColor: 'white',
                        borderColor: 'rgba(255, 255, 255, 0.1)',
                        borderWidth: 1,
                        cornerRadius: 8,
                        displayColors: true,
                        usePointStyle: true
                    }
                },
                scales: {
                    x: {
                        grid: {
                            display: false
                        },
                        ticks: {
                            font: {
                                size: 12,
                                weight: '500'
                            },
                            color: '#6B7280'
                        }
                    },
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(107, 114, 128, 0.1)',
                            drawBorder: false
                        },
                        ticks: {
                            font: {
                                size: 12,
                                weight: '500'
                            },
                            color: '#6B7280',
                            callback: function(value) {
                                return value + ' patients';
                            }
                        }
                    }
                },
                interaction: {
                    intersect: false,
                    mode: 'index'
                }
            }
        });

        // Add some interactive animations
        document.addEventListener('DOMContentLoaded', function() {
            // Animate cards on scroll (simplified)
            const cards = document.querySelectorAll('.group');
            cards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-8px) scale(1.02)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
        });
    </script>
</body>
</html>