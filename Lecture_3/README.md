# Lecture 3 homework

Для установки Linux на виртуальную машину выбрал образ Ubuntu Server 24.04.1 LTS из-за меньшего, чем Desktop-версия, размера.

Настроил параметры виртуальной машины в соответствии с требованиями ДЗ, отключил опцию Unattended Installation.

Процесс инсталляции и первого запуска прошел гладко.

Для тестирования снепшотов создал снепшот сразу после инсталляции. Затем создал текстовый файл в домашней директории пользователя, остановил виртуальную машину и восстановил снепшот. Созданный на предыдущем шаге файл после восстановления отсутствовал, что подтвердило корректное восстановление из снепшота.

Остановил виртуальную машину и с помощью UI VirtualBox размер жесткого диска с 20 ГБ. После запуска виртуальной машины попытался расширить раздел `/dev/sda3` до нового размера с помощью команды `resize2fs` из-под рута, но ОС не дала этого сделать с ошибкой `device or resource busy`.

Увеличил размер памяти до 4 ГБ и количество доступных процессоров до четырех.

Удалил виртуальную машину и все файлы с жесткого диска.

Скриншоты по всем шагам выполнения ДЗ ниже. По-английски, потому что так привык за долгие годы работы на заказчиков из ЕС и США.


## 1. Installing Ubuntu on VirtualBox

### 1.1. First steps
Give machine a name and select installation image
![Choose installation image](create_VM_select_image.png)

### 1.2. Set hardware parameters
Select memory size and number of processors
![Select memory and CPU](create_VM_csutomize_hardware.png)

Select hard disk size
![Select HDD size](create_VM_csutomize_hardware_2.png)

Hardware parameters summary
![Hardware summary](create_VM_csutomize_hardware_3.png)

### 1.3. Set network type to Bridged Adapter
![Select network type](create_VM_select_network_type.png)

### 1.4. Set up shared folders
![Setup shared folders](create_VM_add_shared_folder.png)

### 1.5. Ready to install
![VM summary](create_VM_review_hardware_settings.png)

### 1.6. Installation
Installation progress
![Installation progress](installation_progress_1.png)
![Installation progress](installation_progress_2.png)
![Installation progress](installation_progress_3.png)
![Installation progress](installation_progress_4.png)

Installation complete!
![Installation complete](installation_progress_5.png)

## 2. Managing snapshots

Create a snapshot
![Create snapshot](snapshot_create.png)

Create a text file in home directory
![Create text file](snapshot_text_file_created.png)

Shut down VM and restore from snapshot
![Restore from snapshot](snapshot_restore.png)

Restored VM has no text file in the home directory
![Restored to original](snapshot_restored.png)

## 3. Change VM parameters via UI

## 3.1. Change hard disk size
Set hard disk size to 30 GB using VirtualBox Media Manager
![Change HDD size](change_hardware_change_hdd_size.png)

Trying to expand the partition to new HDD size: failure
![Change partition size](change_hardware_expand_partition.png)

## 3.2 Change CPU and memory settings
Increase available memory to 4 GB
![Change memory size](change_hardware_change_ram.png)

Increase available CPU count to 4
![Change CPU](change_hardware_change_cpu.png)

Settings summary after changes
![Change settings summary](change_hardware_summary.png)

## 4. Remove virtual maching
Remove VM
![Remove VM](remove_vm.png)

Virtual machine removed, no VMs in the list
![VM removed](no_vms.png)
