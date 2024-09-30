local osLinux = "Linux"
local osWindows = "Windows"
local osMacOS = "Darwin"
function os.name()
    return vim.loop.os_uname().sysname
end

function isWindows()
    return os.name() == osWindows
end

function isMacOS()
    return os.name() == osMacOS
end

function isLinux()
    return os.name() == osLinux
end

function file_exists(name)
    local f = io.open(name, 'r')
    if f~= nil then 
        io.close(f)
        return true
    else 
        return false
    end
end

return {
    file_exists=file_exists,
    isWindows=isWindows,
    isMacOS=isMacOS,
    isLinux=isLinux
}

